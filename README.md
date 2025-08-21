# SecureRo

Prototype Roblox code scanning server and plugin.

## Server

Start the server with:

```bash
npm start
```

The server exposes a `/scan` endpoint that accepts Lua code and returns any
issues found.

## Client Example

An example script that sends code to the server lives in
`client/exampleClient.js`.

## Utilities

Reusable math helpers are available in `utils/math.js`.

## Documentation

Static documentation lives in the `docs/` directory. When the server is
running, visit `http://localhost:3000/` to view the docs, API reference,
and changelog.
