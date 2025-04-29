const { promisePool } = require('../config/db');
const responses = require('../utils/responses'); // Importar el archivo de respuestas

// Obtener todos los roles (Solo Admin)
const obtenerRoles = async (req, res) => {
    console.log('Obteniendo todos los roles...');
    try {
        const [roles] = await promisePool.query('SELECT * FROM roles');
        responses.ok(res, roles);
        console.log(roles);
    } catch (error) {
        console.error('❌ Error al obtener roles:', error);
        responses.error(res, 'Error al obtener roles' );
    }
};

// Obtener un rol por ID (Solo el usuario autenticado o Admin)
const obtenerRolPorId = async (req, res) => {
    const { id } = req.params;
    console.log(`Obteniendo rol con ID: ${id}`);

    // Un usuario solo puede ver su propio perfil, a menos que sea administrador
    if (req.user.id !== parseInt(id) && req.user.rol !== 'administrador') {
        return responses.forbidden( res, 'Acceso denegado' );
    }

    try {
        const [rol] = await promisePool.query('SELECT id, nombre FROM roles WHERE id = ?', [id]);
        
        if (rol.length === 0) return responses.unauthorized( res, 'Rol no encontrado' );

        res.json(rol[0]);
    } catch (error) {
        console.error('❌ Error al obtener rol:', error);
        responses.error( res, 'Error al obtener rol' );
    }
};

module.exports = {
    obtenerRoles,
    obtenerRolPorId,
};