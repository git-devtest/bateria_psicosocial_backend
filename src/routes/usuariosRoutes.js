const express = require('express');
const router = express.Router();
const auth = require('../middlewares/auth'); // Middleware para proteger rutas
const { 
    obtenerUsuarios, 
    obtenerUsuarioPorId, 
    crearUsuario, 
    actualizarUsuario, 
    eliminarUsuario,
    cambiarContrasena } = require('../controllers/usuariosController');

// Solo administradores y profesionales pueden acceder a esta ruta
router.get('/usuarios', auth(['administrador', 'profesional']), obtenerUsuarios); // Obtener todos los usuarios
router.post('/usuarios', auth(['administrador']), crearUsuario); // Crear un nuevo usuario
router.put('/usuarios/cambiar-contrasena', auth(), cambiarContrasena); // Cambiar contraseña de un usuario

router.get('/usuarios/:id', auth(['administrador', 'profesional']), obtenerUsuarioPorId); // Obtener un usuario por ID
router.put('/usuarios/:id', auth(['administrador']), actualizarUsuario); // Actualizar usuario
router.delete('/usuarios/:id', auth(['administrador']) , eliminarUsuario); // Eliminar usuario


console.log('✅ usuariosRoutes.js cargado correctamente');

module.exports = router;
