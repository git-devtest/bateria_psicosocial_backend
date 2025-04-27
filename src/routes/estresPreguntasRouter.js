const express = require('express');
const router = express.Router();
const auth = require('../middlewares/auth');
const { obtenerPreguntas, obtenerPreguntaPorId } = require('../controllers/estresPreguntasController');

// Rutas protegidas
router.get('/', auth(), obtenerPreguntas);
router.get('/:id', auth(), obtenerPreguntaPorId);

console.log('✅ estresPreguntasRoutes.js cargado correctamente');

// Exportamos el router
module.exports = router;