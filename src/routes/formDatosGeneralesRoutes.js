const express = require('express');
const router = express.Router();
const auth = require('../middlewares/auth');
const { crearFichaDatosGenerales } = require('../controllers/formDatosGeneralesController');

// Solo profesionales y administradores pueden registrar fichas
router.post('/form-datos-generales', auth(['profesional', 'administrador']), crearFichaDatosGenerales);

console.log('✅ formDatosGeneralesRoutes.js cargado correctamente');

module.exports = router;