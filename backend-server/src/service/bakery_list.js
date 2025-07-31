const pool = require("../database_connection/db")


const query = "SELECT * FROM productos;"

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





