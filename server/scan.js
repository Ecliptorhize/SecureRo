const dangerousPatterns = [
  { pattern: /loadstring/gi, message: 'Use of loadstring is dangerous' },
  { pattern: /getfenv/gi, message: 'Use of getfenv may be exploited' },
  { pattern: /setfenv/gi, message: 'Use of setfenv may be exploited' },
  { pattern: /HttpGet/gi, message: 'HttpGet can run remote code' }
];

function scan(code) {
  const issues = [];
  const lines = code.split('\n');
  lines.forEach((line, index) => {
    dangerousPatterns.forEach(p => {
      if (p.pattern.test(line)) {
        issues.push({ line: index + 1, message: p.message, snippet: line.trim() });
      }
    });
  });
  return issues;
}

module.exports = { scan };
