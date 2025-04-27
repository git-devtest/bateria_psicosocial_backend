const jwt = require('jsonwebtoken');

const auth = (rolesPermitidos = []) => {
    return (req, res, next) => {
        const token = req.headers.authorization?.split(' ')[1];

        if (!token) {
            return res.status(401).json({ error: 'Acceso denegado. Token no proporcionado' });
        }

        try {
            const decoded = jwt.verify(token, process.env.JWT_SECRET);
            req.user = decoded;

            if (!req.user.id || !req.user.rol) {
                return res.status(403).json({ error: 'Token inválido. Falta ID o rol' });
            }

            const rolUsuario = req.user.rol.toLowerCase();
            const rolesNormalizados = rolesPermitidos.map(r => r.toLowerCase());

            if (rolesNormalizados.length === 0 || rolesNormalizados.includes(rolUsuario)) {
                return next();
            }

            return res.status(403).json({ error: 'Acceso denegado. No tienes el rol necesario' });
        } catch (err) {
            return res.status(401).json({ error: 'Token inválido o expirado' });
        }
    };
};

module.exports = auth;
