// index.js
const express = require('express');
const app = express();
const PORT = 8080;

app.use(express.json());

app.get('/', (req, res) => {
  res.send('¡Bienvenido al backend de la panadería!');
});

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
