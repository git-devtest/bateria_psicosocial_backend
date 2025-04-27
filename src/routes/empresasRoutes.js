const express = require('express');
const router = express.Router();
const auth = require('../middlewares/auth'); // Middleware para proteger rutas
const { obtenerEmpresas, obtenerEmpresaPorId, crearEmpresa, actualizarEmpresa, eliminarEmpresa } = require('../controllers/empresasController');

// Solo administradores y profesionales pueden acceder a esta ruta
router.get('/empresas', auth(['administrador', 'profesional']), obtenerEmpresas);
router.get('/empresas/:id', auth(['administrador', 'profesional']), obtenerEmpresaPorId);
router.post('/empresas', auth(['administrador']), crearEmpresa);
router.put('/empresas/:id', auth(['administrador']), actualizarEmpresa);
router.delete('/empresas/:id', auth(['administrador']), eliminarEmpresa);

console.log('✅ empresasRoutes.js cargado correctamente');

// Exportar las rutas
module.exports = router;