const { promisePool } = require('../config/db'); // Pool de conexiones a la base de datos
const responses = require('../utils/responses'); // Funciones de respuesta}

// Obtener todas las empresas
const obtenerEmpresas = async (req, res) => {
    console.log('Obteniendo todas las empresas...');

    try {
        const [empresas] = await promisePool.query('SELECT * FROM empresas');
        responses.ok(res, empresas);
    } catch (error) {
        console.error('Error al obtener empresas:', error);
        responses.error( res, 'Error al obtener empresas' );
    }
};

// Obtener una empresa por ID
const obtenerEmpresaPorId = async (req, res) => {
    const { id } = req.params;

    try {
        const [empresa] = await promisePool.query('SELECT * FROM empresas WHERE id = ?', [id]);

        if (empresa.length === 0) {
            return responses.notFound(res, 'Empresa no encontrada' );
        }

        res.json(empresa[0]);
    } catch (error) {
        console.error('Error al obtener empresa:', error);
        responses.error( res, 'Error al obtener empresa' );
    }
}

// Crear una empresa
const crearEmpresa = async (req, res) => {
    const { nombre, nit, email, telefono, direccion } = req.body;
    const idUsuarioAutenticado = req.user.id; // ID del usuario autenticado

    try {
        console.log('Creando nueva empresa...');
        // Verificar si la empresa ya existe
        const [existingEmpresa] = await promisePool.query('SELECT * FROM empresas WHERE nit = ?', [nit]);
        if (existingEmpresa.length > 0) {
            return responses.badRequest( res, 'La empresa ya existe' );
        }

        // Establecer el usuario autenticado como el que está haciendo la consulta, para identificar
        // quien ejecuta acciones y registrarlo en la tabla de logs
        await promisePool.query('SET @usuario_actual = ?', [idUsuarioAutenticado]); // Establecer el usuario autenticado
        
        const [result] = await promisePool.query(
            'INSERT INTO empresas (nombre, nit, email, telefono, direccion) VALUES (?, ?, ?, ?, ?)',
            [nombre, nit, email, telefono, direccion]
        );

        responses.created( res, { id: result.insertId, nombre, direccion, telefono } );
    } catch (error) {
        console.error('Error al crear empresa:', error);
        responses.error( res, 'Error al crear empresa' );
    }
}

// Actualizar una empresa
const actualizarEmpresa = async (req, res) => {
    const { id } = req.params;
    const { nombre, nit, email, telefono, direccion } = req.body;
    const idUsuarioAutenticado = req.user.id; // ID del usuario autenticado
    console.log('Actualizando empresa...');

    // Verificar si la empresa existe
    const [existingEmpresa] = await promisePool.query('SELECT * FROM empresas WHERE id = ?', [id]);
    if (existingEmpresa.length === 0) {
        console.log('Empresa no registrada, siguiente validación...');
        return responses.notFound( res, 'Empresa no encontrada' );
    }
    
    // Verificar si el NIT ya está en uso por otra empresa
    const [existingNit] = await promisePool.query('SELECT * FROM empresas WHERE nit = ? AND id != ?', [nit, id]);
    if (existingNit.length > 0) {
        return responses.badRequest( res, 'El NIT ya está en uso por otra empresa' );
    }
    console.log('NIT no registrado, siguiente validación...');

    // Verificar si el email ya está en uso por otra empresa
    const [existingEmail] = await promisePool.query('SELECT * FROM empresas WHERE email = ? AND id != ?', [email, id]);
    if (existingEmail.length > 0) {
        return responses.badRequest( res, 'El email ya está en uso por otra empresa' );
    }
    console.log('Email no registrado, siguiente validación...');
    
    try {
        // Establecer el usuario autenticado como el que está haciendo la consulta, para identificar
        // quien ejecuta acciones y registrarlo en la tabla de logs
        await promisePool.query('SET @usuario_actual = ?', [idUsuarioAutenticado]); // Establecer el usuario autenticado

        // Actualizar la empresa
        const [result] = await promisePool.query('UPDATE empresas SET nombre = ?, nit = ?, email = ?, telefono = ?, direccion = ? WHERE id = ?', [nombre, nit, email, telefono, direccion, id]);

        if (result.affectedRows === 0) {
            return responses.notFound( res, 'Empresa no encontrada' );
        }
        console.log('Empresa actualizada correctamente');

        responses.ok(res, { id, nombre, nit, email, telefono, direccion });
    } catch (error) {
        console.error('Error al actualizar empresa:', error);
        responses.error( res, 'Error al actualizar empresa' );
    }
}

// Eliminar una empresa
const eliminarEmpresa = async (req, res) => {
    const { id } = req.params;
    const idUsuarioAutenticado = req.user.id; // ID del usuario autenticado
    console.log('Eliminando empresa con id:', id);

    // Verificar si la empresa existe
    const [existingEmpresa] = await promisePool.query('SELECT * FROM empresas WHERE id = ?', [id]);
    if (existingEmpresa.length === 0) {
        console.log('Empresa no registrada, siguiente validación...');
        return responses.notFound( res, 'Empresa no encontrada' );
    }

    try {
        // Establecer el usuario autenticado como el que está haciendo la consulta, para identificar
        // quien ejecuta acciones y registrarlo en la tabla de logs
        await promisePool('SET @usuario_actual = ?', [idUsuarioAutenticado]); // Establecer el usuario autenticado

        const [result] = await promisePool.query('DELETE FROM empresas WHERE id = ?', [id]);

        if (result.affectedRows === 0) {
            return responses.notFound( res, 'Empresa no encontrada' );
        }

        responses.ok( res, { message: 'Empresa eliminada correctamente' } );
    } catch (error) {
        console.error('Error al eliminar empresa:', error);
        responses.error( res, 'Error al eliminar empresa' );
    }
}

module.exports = {
    obtenerEmpresas,
    obtenerEmpresaPorId,
    crearEmpresa,
    actualizarEmpresa,
    eliminarEmpresa
};