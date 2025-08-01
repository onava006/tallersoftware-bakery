
 const { Pool } = require('pg');

const query = "SELECT * FROM productos;"



const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: "appdb", // Nombre real de la base de datos (NO el nombre de conexión)
  host: `tallersoftware-467001:us-central1:postgres-instance` // Ej: tallersoftware-467001:us-central1:postgres-instance
});



const getBreadStock = async () => {
  
try{
    const res = await pool.query(query);
    return res
  } catch (err) {
    console.error('Error conectando a la base de datos:', err);
    return null;
  }

}

module.exports = getBreadStock;





