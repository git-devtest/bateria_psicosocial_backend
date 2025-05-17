const mysql = require('mysql2');
require('dotenv').config();

// Crear la conexión a la base de datos
const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT || 3306, // Puerto por defecto de MySQL
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Probar la conexión
pool.getConnection((err, connection) => {
    if (err) {
        console.error('Error al conectar a la base de datos:', err);
        process.exit(1); // Detiene el servidor si no hay conexión
    }
    console.log('Conexión a la base de datos establecida');
    connection.release();
});

// Creo el promisePool para reducir líneas
const promisePool = pool.promise();

// Exportar el pool para usarlo en otros módulos
module.exports = { pool, promisePool };
