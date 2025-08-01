 const { Pool } = require('pg');


const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: "appdb", // Nombre real de la base de datos (NO el nombre de conexión)
  host: `/cloudsql/tallersoftware-467001:us-central1:postgres-instance` // Ej: tallersoftware-467001:us-central1:postgres-instance
});


async function testQuery() {
  try {
    const res = await pool.query('SELECT NOW()');
    console.log('Hora actual en la base de datos:', res.rows[0]);
    return res
  } catch (err) {
    console.error('Error conectando a la base de datos:', err);
  }
}

module.exports = testQuery;