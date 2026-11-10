param([string]$OutputZip = (Join-Path $PSScriptRoot '../../hsdeck plugin.zip'))
$ErrorActionPreference = 'Stop'
$pluginRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../plugin/hscard'))
$zipPath = [IO.Path]::GetFullPath($OutputZip)

# Always version the entire module graph before creating an installable ZIP.
& node (Join-Path $PSScriptRoot 'prepare-plugin-assets.mjs')
if ($LASTEXITCODE -ne 0) { throw 'Asset revision generation failed.' }

$files = @()
foreach ($directory in @('admin', 'includes', 'assets')) {
    $files += Get-ChildItem -LiteralPath (Join-Path $pluginRoot $directory) -File -Recurse
}
foreach ($name in @('hscard.php', 'uninstall.php', 'readme.txt', 'license.txt')) {
    $files += Get-Item -LiteralPath (Join-Path $pluginRoot $name)
}
$files = @($files | Sort-Object FullName)
$parent = Split-Path -Parent $zipPath
[IO.Directory]::CreateDirectory($parent) | Out-Null
$temporary = Join-Path $parent ('.hscard-' + [guid]::NewGuid().ToString('N') + '.zip')
Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName System.IO.Compression
try {
    $archive = [IO.Compression.ZipFile]::Open($temporary, [IO.Compression.ZipArchiveMode]::Create)
    try {
        foreach ($file in $files) {
            $relative = $file.FullName.Substring($pluginRoot.Length + 1).Replace('\', '/')
            [IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $file.FullName, ('hscard/' + $relative), [IO.Compression.CompressionLevel]::Optimal) | Out-Null
        }
    } finally { $archive.Dispose() }
    $archive = [IO.Compression.ZipFile]::OpenRead($temporary)
    try {
        if ($archive.Entries.Count -ne $files.Count -or !$archive.GetEntry('hscard/hscard.php')) {
            throw 'Invalid plugin archive structure.'
        }
    } finally { $archive.Dispose() }
    if ([IO.File]::Exists($zipPath)) { [IO.File]::Replace($temporary, $zipPath, [NullString]::Value) }
    else { [IO.File]::Move($temporary, $zipPath) }
    Get-Item -LiteralPath $zipPath | Select-Object FullName, Length
    Write-Output ('SHA256: ' + (Get-FileHash -LiteralPath $zipPath -Algorithm SHA256).Hash)
} finally {
    if ([IO.File]::Exists($temporary)) { [IO.File]::Delete($temporary) }
}
