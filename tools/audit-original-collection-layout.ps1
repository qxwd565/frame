param([switch]$Refresh)
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [Text.UTF8Encoding]::new($false)
[void][Reflection.Assembly]::LoadFrom('E:\프로그램\AssetStudio.net6.v0.16.47\Mono.Cecil.dll')
$base = 'E:\HSdeck\frame\v7.14.4-webgpu-20261109\assets\unity\historical-frames'
$destination = 'E:\hearthstone card\시기별 프레임 직업별 렌더 비교\베타-오리지널 수집품 배치 코드.json'
if ([IO.File]::Exists($destination) -and !$Refresh) { throw 'Existing layout report: use -Refresh to update this generated report' }

function Read-GzipBytes([string]$Path) {
    $inputStream = [IO.File]::OpenRead($Path)
    $gzip = [IO.Compression.GZipStream]::new($inputStream, [IO.Compression.CompressionMode]::Decompress)
    $outputStream = [IO.MemoryStream]::new()
    try { $gzip.CopyTo($outputStream); return ,$outputStream.ToArray() }
    finally { $gzip.Dispose(); $inputStream.Dispose(); $outputStream.Dispose() }
}

$selected = @{
    'CollectionPageDisplay' = @('GetCollectionCardVisual', 'GetNumColumns', 'GetMaxNumCards', '.cctor')
    'CollectionPageManager' = @('PositionCurrentPage', '.cctor')
    'CollectionCardVisual' = @('SetActor', '.cctor')
    'BigCard' = @('DisplayBigCard', 'FitInsideScreen')
    'ZoneHand' = @('GetCardScale', 'GetCardPosition', '.cctor')
    'Actor' = @('.ctor')
}
$results = [Collections.Generic.List[object]]::new()
foreach ($build in @('3664','3749','3890','3937','4217','4243','4458','4482','4944')) {
    $snapshot = Join-Path $base ('early-native\snapshots\pc-1.0.0.' + $build + '.json.gz')
    $data = [Text.Encoding]::UTF8.GetString((Read-GzipBytes $snapshot)) | ConvertFrom-Json
    $asset = @($data.managedAssemblies | Where-Object name -eq 'Assembly-CSharp.dll')
    if ($asset.Count -ne 1 -or !$asset[0].original.file) { throw 'Missing source assembly for build ' + $build }
    $bytes = Read-GzipBytes (Join-Path $base $asset[0].original.file)
    $digest = [Convert]::ToHexString([Security.Cryptography.SHA256]::HashData($bytes)).ToLowerInvariant()
    if ($digest -ne $asset[0].original.rawSha256) { throw 'Source assembly hash mismatch: ' + $build }
    $memory = [IO.MemoryStream]::new($bytes, $false)
    try {
        $assembly = [Mono.Cecil.AssemblyDefinition]::ReadAssembly($memory)
        $methods = [Collections.Generic.List[object]]::new()
        foreach ($typeName in $selected.Keys) {
            $type = $assembly.MainModule.GetType($typeName)
            if (!$type) { continue }
            foreach ($method in $type.Methods) {
                if ($method.Name -notin $selected[$typeName] -or !$method.HasBody) { continue }
                $instructions = @($method.Body.Instructions | ForEach-Object { $_.ToString() })
                $methods.Add([ordered]@{name=$method.FullName; instructions=$instructions})
            }
        }
        $results.Add([ordered]@{version=('1.0.0.' + $build); assemblySha256=$digest; methods=$methods})
    } finally { if ($assembly) { $assembly.Dispose() }; $memory.Dispose() }
}
$report = [ordered]@{
    scope = 'Original PC IL; runtime state and iOS native AOT behavior are not assumed.'
    versions = $results
}
[IO.File]::WriteAllText($destination, ($report | ConvertTo-Json -Depth 40), [Text.UTF8Encoding]::new($false))
Write-Output ('Versions: ' + $results.Count + '; report: ' + $destination)
