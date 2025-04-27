const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { promisePool } = require('../config/db'); // Asegúrate de que la ruta sea correcta

const register = async (req, res) => {
    const { nombre, email, contrasena, rol_id, empresa_id } = req.body;

    try {
        const hashedPassword = await bcrypt.hash(contrasena, 10);
        const sql = 'INSERT INTO usuarios (nombre, email, contrasena, rol_id, empresa_id) VALUES (?, ?, ?, ?, ?)';
        await promisePool.execute(sql, [nombre, email, hashedPassword, rol_id, empresa_id]);

        res.status(201).json({ message: 'Usuario registrado correctamente' });
    } catch (error) {
        console.error('❌ Error en el registro:', error);
        res.status(500).json({ error: 'Error al registrar usuario' });
    }
};

const login = async (req, res) => {
    const { email, contrasena } = req.body;

    try {
        const [rows] = await promisePool.execute(
            `SELECT u.id, u.nombre, u.email, u.contrasena, r.nombre AS rol 
             FROM usuarios u
             JOIN roles r ON u.rol_id = r.id
             WHERE u.email = ?`,
            [email]
        );
        if (rows.length === 0) return res.status(401).json({ error: 'Correo o contraseña incorrectos' });

        const user = rows[0];
        const isMatch = await bcrypt.compare(contrasena, user.contrasena);
        if (!isMatch) return res.status(401).json({ error: 'Correo o contraseña incorrectos' });

        const token = jwt.sign({ id: user.id, rol: user.rol }, process.env.JWT_SECRET, { expiresIn: '2h' });
        console.log('✅ Token generado:', token);

        res.json({ token });
    } catch (error) {
        console.error('❌ Error en el login:', error);
        res.status(500).json({ error: 'Error al iniciar sesión' });
    }
};

const getProfile = async (req, res) => {
    try {
        const userId = req.user.id; // Obtenemos el ID del usuario desde el token
        const [rows] = await promisePool.execute(
            'SELECT id, nombre, email, rol_id, empresa_id FROM usuarios WHERE id = ?',
            [userId]
        );

        if (rows.length === 0) {
            return res.status(404).json({ error: 'Usuario no encontrado' });
        }

        res.json(rows[0]);
    } catch (error) {
        console.error('❌ Error obteniendo perfil:', error);
        res.status(500).json({ error: 'Error al obtener el perfil' });
    }
};

module.exports = { register, login, getProfile };

