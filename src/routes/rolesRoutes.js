const express = require('express');
const router = express.Router();
const auth = require('../middlewares/auth'); // Middleware para proteger rutas
const { obtenerRoles, obtenerRolPorId } = require('../controllers/rolesController');

// Solo administradores y profesionales pueden acceder a esta ruta
router.get('/roles', auth(['administrador', 'profesional']), obtenerRoles); // Obtener todos los roles
router.get('/roles/:id', auth(['administrador', 'profesional']), obtenerRolPorId); // Obtener un rol por ID

console.log('✅ rolesRoutes.js cargado correctamente');

module.exports = router;