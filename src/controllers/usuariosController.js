const bcryptjs = require('bcryptjs');
const { promisePool } = require('../config/db');
const responses = require('../utils/responses'); // Importar el archivo de respuestas

// Obtener todos los usuarios (Solo Admin)
const obtenerUsuarios = async (req, res) => {
    console.log('Obteniendo todos los usuarios...');
    try {
        const [usuarios] = await promisePool.query('SELECT * FROM usuarios');
        responses.ok(res, usuarios);
        console.log(usuarios);
    } catch (error) {
        console.error('❌ Error al obtener usuarios:', error);
        responses.error(res, 'Error al obtener usuarios' );
    }
};

// Obtener un usuario por ID (Solo el usuario autenticado o Admin)
const obtenerUsuarioPorId = async (req, res) => {
    const { id } = req.params;
    console.log(`Obteniendo usuario con ID: ${id}`);

    // Un usuario solo puede ver su propio perfil, a menos que sea administrador
    if (req.user.id !== parseInt(id) && req.user.rol !== 'administrador') {
        return responses.forbidden( res, 'Acceso denegado' );
    }

    try {
        const [usuario] = await promisePool.query('SELECT id, nombre, email, rol_id, empresa_id FROM usuarios WHERE id = ?', [id]);
        
        if (usuario.length === 0) return responses.unauthorized( res, 'Usuario no encontrado' );

        res.json(usuario[0]);
    } catch (error) {
        console.error('❌ Error al obtener usuario:', error);
        responses.error( res, 'Error al obtener usuario' );
    }
};

// Actualizar un usuario, solo el usuario autenticado o administrador pueden actualizar su perfil
const actualizarUsuario = async (req, res) => {
    const { id } = req.params;
    const { nombre, email, contrasena, rol_id, empresa_id } = req.body;
    const idUsuarioAutenticado = req.user.id;
    console.log(`⚡ Actualizando usuario con ID: ${id}`);

    try {
        // Establecer el usuario autenticado como el que está haciendo la consulta, para identificar
        // quien ejecuta acciones y registrarlo en la tabla de logs
        await promisePool.query('SET @usuario_actual = ?', [idUsuarioAutenticado]); // 🔥 Establecer usuario en MySQL

        let hashedPassword;

        if (contrasena) {
            // Si el usuario envió una nueva contraseña, la encriptamos
            const salt = await bcryptjs.genSalt(10);
            hashedPassword = await bcryptjs.hash(contrasena, salt);
        }

        // Obtener el usuario actual para no modificar la contraseña si no se envió una nueva
        const [user] = await promisePool.query('SELECT contrasena FROM usuarios WHERE id = ?', [id]);

        if (user.length === 0) {
            return responses.notFound( res, 'Usuario no encontrado' );
        }

        // Si no se envió una nueva contraseña, mantenemos la anterior
        hashedPassword = contrasena ? hashedPassword : user[0].contrasena;

        const [result] = await promisePool.query(
            'UPDATE usuarios SET nombre = ?, email = ?, contrasena = ?, rol_id = ?, empresa_id = ? WHERE id = ?',
            [nombre, email, hashedPassword, rol_id, empresa_id, id]
        );

        if (result.affectedRows === 0) {
            return responses.notFound( res, { error: 'Usuario no encontrado' });
        }

        responses.ok( res, 'Usuario actualizado correctamente' );
    } catch (error) {
        console.error('❌ Error al actualizar usuario:', error);
        responses.error( res, 'Error al actualizar usuario' );
    }
};

// Eliminar un usuario, solo un administrador puede eliminar usuarios
const eliminarUsuario = async (req, res) => {
    const { id } = req.params;
    console.log(`⚡ Eliminando usuario con ID: ${id}`);
    const idUsuarioAutenticado = req.user.id;

    try {
        // Establecer el usuario autenticado como el que está haciendo la consulta, para identificar
        // quien ejecuta acciones y registrarlo en la tabla de logs
        await promisePool.query('SET @usuario_actual = ?', [idUsuarioAutenticado]); // 🔥 Establecer usuario en MySQL

        const [result] = await promisePool.execute('DELETE FROM usuarios WHERE id = ?', [id]);

        if (result.affectedRows === 0) {
            console.log(`❌ No se encontró el usuario con ID: ${id}`);
            return responses.notFound( res, 'Usuario no encontrado' );
        }

        console.log(`✅ Usuario con ID ${id} eliminado correctamente`);
        responses.ok( res, 'Usuario eliminado correctamente' );

    } catch (error) {
        console.error('❌ Error al eliminar usuario:', error);
        responses.error( res, 'Error al eliminar usuario' );
    }
};

// Crear un nuevo usuario, solo un administrador puede crear usuarios
const crearUsuario = async (req, res) => {
    const { nombre, email, contrasena, rol_id, empresa_id } = req.body;
    const idUsuarioAutenticado = req.user.id;
    console.log(`⚡ Creando nuevo usuario: ${nombre} con rol: ${rol_id}`);

    try {
        // Asegurar que email sea único antes de crear el usuario
        const [existingUser] = await promisePool.query('SELECT * FROM usuarios WHERE email = ?', [email]);
        
        if (existingUser.length > 0) {
            return responses.conflict( res, 'El email ya está en uso' );
        }

        // Establecer el usuario autenticado como el que está haciendo la consulta, para identificar
        // quien ejecuta acciones y registrarlo en la tabla de logs
        await promisePool.query('SET @usuario_actual = ?', [idUsuarioAutenticado]); // 🔥 Establecer usuario en MySQL
        
        // Encriptar la contraseña antes de guardarla
        const salt = await bcryptjs.genSalt(10); // Generar un "salt" para el hash
        const hashedPassword = await bcryptjs.hash(contrasena, salt); // Hashear la contraseña
        console.log('Hashed Password:', hashedPassword);

        const [result] = await promisePool.query(
            'INSERT INTO usuarios (nombre, email, contrasena, rol_id, empresa_id) VALUES (?, ?, ?, ?, ?)',
            [nombre, email, hashedPassword, rol_id, empresa_id]
        );

        responses.created( res, { message: 'Usuario creado correctamente', id: result.insertId });
    } catch (error) {
        console.error('❌ Error al crear usuario:', error);
        responses.error( res, 'Error al crear usuario' );
    }
}

// POST /api/usuarios/cambiar-contrasena
const cambiarContrasena = async (req, res) => {
    const userId = req.user.id; // Desde el token
    const { actual, nueva } = req.body;
  
    try {
      // 1. Obtener contraseña actual
      const [rows] = await promisePool.query('SELECT contrasena FROM usuarios WHERE id = ?', [userId]);
      if (rows.length === 0) return responses.notFound( res, 'Usuario no encontrado' );
  
      const isMatch = await bcryptjs.compare(actual, rows[0].contrasena);
      if (!isMatch) return responses.badRequest( res, 'La contraseña actual es incorrecta' );
  
      // 2. Hashear y actualizar
      const hashedNueva = await bcryptjs.hash(nueva, 10);
      await promisePool.query('UPDATE usuarios SET contrasena = ? WHERE id = ?', [hashedNueva, userId]);
  
      responses.ok( res, 'Contraseña actualizada correctamente' );
    } catch (error) {
      console.error('❌ Error al cambiar contraseña:', error);
      responses.error( res, 'Error al cambiar contraseña' );
    }
  };  

module.exports = { 
    obtenerUsuarios, 
    obtenerUsuarioPorId, 
    actualizarUsuario, 
    eliminarUsuario, 
    crearUsuario,
    cambiarContrasena
};
