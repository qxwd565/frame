import http from 'node:http';
import fs from 'node:fs/promises';
import path from 'node:path';
import {fileURLToPath} from 'node:url';

const project = fileURLToPath(new URL('../', import.meta.url));
const resources = path.resolve(process.argv[2] || path.join(project, '../../v7.14.4-webgpu-20261109/assets/unity'));
const roots = {'/plugin/': project, '/resources/': resources, '/work/': path.join(project, 'tests'), '/fixtures/': path.resolve(project, '../../.build')};
http.createServer(async (req, res) => {
  try {
    const url = new URL(req.url, 'http://localhost');
    const prefix = Object.keys(roots).find(value => url.pathname.startsWith(value));
    if (!prefix) { res.writeHead(404); return res.end(); }
    const root = path.resolve(roots[prefix]);
    const file = path.resolve(root, decodeURIComponent(url.pathname.slice(prefix.length)));
    if (!file.startsWith(root + path.sep)) { res.writeHead(403); return res.end(); }
    const body = await fs.readFile(file);
    const type = {'.mjs':'text/javascript', '.js':'text/javascript', '.html':'text/html', '.json':'application/json', '.css':'text/css', '.wasm':'application/wasm', '.png':'image/png', '.webp':'image/webp'}[path.extname(file)] || 'application/octet-stream';
    res.writeHead(200, {'Content-Type':type, 'Cache-Control':'no-store', 'Access-Control-Allow-Origin':'*'});
    res.end(body);
  } catch (error) { res.writeHead(404); res.end(error.message); }
}).listen(19420, '127.0.0.1', () => console.log('Verification server: http://127.0.0.1:19420/work/'));
