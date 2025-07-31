const testQuery = require("./src/service/test_query")
const createTables =  require("./src/service/create_tables")
const getBreadStock = require("./src/service/bakery_list")

const express = require('express');
const app = express();
const PORT = process.env.PORT || 8080;

app.use(express.json());

app.get('/', (req, res) => {
  res.send('¡Bienvenido al backend de la panadería!');
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
