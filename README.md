# SecureRo


## Components

- **Node.js API** (`server/`): provides `/scan` endpoint that checks Lua source code for dangerous patterns.
- **Dockerfile**: container to run the API.
- **GitHub Actions**: basic CI running tests.
- **VS Code settings**: consistent formatting.

## Usage

1. Install dependencies and start the server:
   ```bash
   npm install
   npm start
