const testQuery = require("./src/service/test_query")
const getBreadStock = require("./src/service/bakery_list")

const express = require('express');
const app = express();
const PORT = process.env.PORT || 8080;

app.use(express.json());

app.get('/', (req, res) => {
  res.send('¡Bienvenido al backend de la panadería!');
console.log("Conectando a la base de datos con los siguientes parámetros:");
console.log(`USER: ${process.env.DB_USER}`);
console.log(`PASSWORD: ${process.env.DB_PASSWORD}`);
console.log(`DATABASE: tallersoftware-467001:us-central1:postgres-instance`);
console.log(`HOST: ${process.env.DB_HOST}`);
console.log(`SOCKET PATH: ${process.env.DB_HOST}`);

});


app.get('/productos', async (req, res) => {
  try {
    const result = await getBreadStock();
    res.json({ success: true, data: result });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

app.post('/pedido', async (req, res) => {

console.log('estamos guardando el pedido')

})


app.get('/db-test', async (req, res) => {
  try {
    const result = await testQuery();
    res.json({ success: true, data: result });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
