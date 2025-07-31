
const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  host: process.env.DB_HOST, // Debe ser /cloudsql/...
  socketPath: process.env.DB_HOST, // Necesario para Cloud SQL
});