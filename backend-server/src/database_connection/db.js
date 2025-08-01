

 const { Pool } = require('pg');


const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: "appdb", // Nombre real de la base de datos (NO el nombre de conexión)
  host: `/cloudsql/tallersoftware-467001:us-central1:postgres-instance` // Ej: tallersoftware-467001:us-central1:postgres-instance
});



// Función para probar la conexión
async function testConnection() {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT NOW()');
    console.log('✅ Conexión exitosa a la base de datos');
    console.log('Tiempo del servidor:', result.rows[0].now);
    client.release();
    return true;
  } catch (error) {
    console.error('❌ Error al conectar a la base de datos:', error.message);
    return false;
  }
}




module.exports = testConnection;
