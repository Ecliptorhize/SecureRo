# SecureRo

Prototype Roblox code scanning server and plugin.

## Components

- **Node.js API** (`server/`): provides `/scan` endpoint that checks Lua source code for dangerous patterns.
- **Roblox Studio plugin** (`plugin/SecureRoPlugin.lua`): sends selected scripts to the API and reports potential issues.
- **Dockerfile**: container to run the API.
- **GitHub Actions**: basic CI running tests.
- **VS Code settings**: consistent formatting.

## Usage

1. Install dependencies and start the server:
   ```bash
   npm install
   npm start
   ```
2. In Roblox Studio, install `plugin/SecureRoPlugin.lua` as a plugin.
3. Select scripts and click **Scan** on the toolbar.

## Testing

Run `npm test` to execute a simple scanner test.
