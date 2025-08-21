const express = require('express');
const path = require('path');
const { scan } = require('./scan');

const app = express();
app.use(express.json({ limit: '1mb' }));
app.use(express.static(path.join(__dirname, '..', 'docs')));

app.post('/scan', (req, res) => {
  const { code } = req.body;
  if (typeof code !== 'string') {
    return res.status(400).json({ error: 'code must be a string' });
  }
  const issues = scan(code);
  res.json({ issues });
});

const port = process.env.PORT || 3000;
if (require.main === module) {
  app.listen(port, () => {
    console.log(`SecureRo server listening on ${port}`);
  });
}

module.exports = app;
