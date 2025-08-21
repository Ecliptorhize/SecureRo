const exampleCode = "print('hello')\nloadstring('print(1)')";

async function main() {
  const response = await fetch('http://localhost:3000/scan', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ code: exampleCode })
  });
  const data = await response.json();
  console.log('Issues:', data.issues);
}

main().catch(err => {
  console.error('Failed to contact server', err);
});
