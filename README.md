# SecureRo

Prototype Roblox code scanning server, framework, and plugin.

## Components

- **Node.js API** (`server/`): provides `/scan` endpoint that checks Lua source code for dangerous patterns.
- **Roblox framework** (`framework/`): Rojo project containing a loader and `ScanService` for in-game use similar to the Nevermore engine.
- **Roblox Studio plugin** (`plugin/SecureRoPlugin.lua`): uses the framework to scan selected scripts and report potential issues.
- **Dockerfile**: container to run the API.
- **GitHub Actions**: basic CI running tests.
- **VS Code settings**: consistent formatting.

## Usage

1. Install dependencies and start the server:
   ```bash
   npm install
   npm start
   ```
2. Use Rojo to sync the framework into `ReplicatedStorage`:
   ```bash
   rojo serve framework/default.project.json
   ```
3. In Roblox Studio, install `plugin/SecureRoPlugin.lua` as a plugin.
4. Ensure `ReplicatedStorage` contains the `SecureRo` modules, select scripts and click **Scan** on the toolbar.

## Testing

Run `npm test` to execute a simple scanner test.
