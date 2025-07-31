const pool = require("../database_connection/db")

async function testQuery() {
  try {``
    const res = await pool.query('SELECT NOW()');
    console.log('Hora actual en la base de datos:', res.rows[0]);
  } catch (err) {
    console.error('Error conectando a la base de datos:', err);
  }
}

module.exports = testQuery;

