const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Express frontend is running!');
});

app.listen(PORT, () => {
  console.log(`Frontend server running on port ${PORT}`);
});

