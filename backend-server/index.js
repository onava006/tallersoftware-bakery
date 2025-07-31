const testQuery = require("./src/service/bakery_list")


const express = require('express');
const app = express();
const PORT = process.env.PORT || 8080;

app.use(express.json());

app.get('/', (req, res) => {
  res.send('¡Bienvenido al backend de la panadería!');
});

app.listen(PORT, () => {
  testQuery();
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
