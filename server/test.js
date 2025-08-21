const { scan } = require('./scan');

const sample = "print('hello')\nloadstring('print(1)')";
const issues = scan(sample);
if (issues.length === 1 && issues[0].line === 2) {
  console.log('Scan function works');
  process.exit(0);
} else {
  console.error('Scan function failed', issues);
  process.exit(1);
}
