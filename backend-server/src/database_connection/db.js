

/* const { Pool } = require('pg');



const pool = new Pool({

  user: process.env.DB_USER,

  password: process.env.DB_PASSWORD,


  database: "tallersoftware-467001:us-central1:postgres-instance",


  host: process.env.DB_HOST, // Debe ser /cloudsql/...

  socketPath: process.env.DB_HOST, // Necesario para Cloud SQL

}); */


const { Pool } = require('pg');
require('dotenv').config();

// Configuración de conexión para tu instancia de PostgreSQL en GCP
const dbConfig = {
  // Host: IP interna de tu instancia
  host: '10.219.0.3',
  
  // Puerto por defecto de PostgreSQL
  port: 5432,
  
  // Nombre de la base de datos
  database: 'appdb',
  
  // Credenciales (usar variables de entorno)
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  
  // Configuración del pool de conexiones
  max: 20, // máximo número de conexiones en el pool
  idleTimeoutMillis: 30000, // tiempo antes de cerrar conexiones inactivas
  connectionTimeoutMillis: 2000, // tiempo de espera para nueva conexión
  
  // Configuración SSL (opcional, pero recomendado)
  ssl: false // Tu configuración actual no requiere SSL
};

// Crear el pool de conexiones
const pool = new Pool(dbConfig);

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

async function executeQuery(text, params = []) {
  const client = await pool.connect();
  try {
    const result = await client.query(text, params);
    return result;
  } catch (error) {
    console.error('Error ejecutando query:', error);
    throw error;
  } finally {
    client.release();
  }
}


module.exports = testConnection();
module.exports = executeQuery(); 