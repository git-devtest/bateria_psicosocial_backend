const express = require('express');
const router = express.Router();
const auth = require('../middlewares/auth');
const {
    guardarRespuestas,
    obtenerRespuestasPorFormulario
} = require('../controllers/estresRespuestasController');

// Ruta para guardar respuestas (acceso restringido)
router.post('/', auth(['profesional', 'digitador']), guardarRespuestas);

// Ruta para obtener respuestas de un formulario
router.get('/:id_formulario', auth(), obtenerRespuestasPorFormulario);

console.log('✅ estresRespuestasRoutes.js cargado correctamente');

module.exports = router;
