async function testQuery() {
  try {``
    const res = await pool.query('SELECT NOW()');
    console.log('Hora actual en la base de datos:', res.rows[0]);
    return res
  } catch (err) {
    console.error('Error conectando a la base de datos:', err);
  }
}

module.exports = testQuery;