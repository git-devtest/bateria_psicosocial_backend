const express = require('express');
const router = express.Router();
const auth = require('../middlewares/auth'); // Middleware para proteger rutas
const { promisePool } = require('../config/db'); // Importar la configuración de la base de datos
const responses = require('../utils/responses');

// GET Obteter todos los cargos
router.get('/tipos-cargo', auth(), async (req, res) => {
    try {
        const [rows] = await promisePool.query('SELECT * FROM tipo_cargo');
        responses.ok( res, rows );
        console.log('Tipos de cargo obtenidos correctamente');
        console.log(rows);
    } catch (error) {
        console.error('Error al obtener los tipos de cargos:', error);
        responses.error( res, 'Error al obtener los tipos de cargos' );
    }
});

// GET Obtener todos los tipos de contrato
router.get('/tipos-contrato', auth(), async (req, res) => {
    try {
        const [rows] = await promisePool.query('SELECT * FROM tipo_contrato');
        responses.ok( res, rows );
        console.log('Tipos de contrato obtenidos correctamente');
        console.log(rows);
    } catch (error) {
        console.error('Error al obtener los tipos de contrato:', error);
        responses.error( res, 'Error al obtener los tipos de contrato' );
    }
});

// GET Obtener todos los tipos de salario
router.get('/tipos-salario', auth(), async (req, res) => {
    try {
        const [rows] = await promisePool.query('SELECT * FROM tipo_salario');
        responses.ok( res, rows );
        console.log('Tipos de salario obtenidos correctamente');
        console.log(rows);
    } catch (error) {
        console.error('Error al obtener los tipos de salario:', error);
        responses.error( res, 'Error al obtener los tipos de salario' );
    }
});

console.log('✅ catalogoRoutes.js cargado correctamente');

module.exports = router;