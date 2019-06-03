const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'public',
  password: 'pass',
  port: 5432,
})

const getparcelById = (request, response) => {
  const id = request.params.id
  
  pool.query('select * from public.v_dzialki where id_ewidencyjny = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    console.log(results)
    response.status(200).json(results)
    
  })
}

module.exports = {
  getparcelById,
}