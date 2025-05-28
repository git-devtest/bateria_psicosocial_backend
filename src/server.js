require('dotenv').config();
const { promisePool } = require('./config/db'); // Importar la configuración de la base de datos

// Importar dependencias
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
const bcryptjs = require('bcryptjs');

// Crear la aplicación Express
const app = express();

// Importar rutas
const authRoutes = require('./routes/authRoutes');
const usuariosRoutes = require('./routes/usuariosRoutes');
const empresasRoutes = require('./routes/empresasRoutes');
const rolesRoutes = require('./routes/rolesRoutes');
const estresPreguntasRoutes = require('./routes/estresPreguntasRouter');
const estresRespuestasRoutes = require('./routes/estresRespuestasRoutes');
const formDatosGeneralesRoutes = require('./routes/formDatosGeneralesRoutes');
const catalogoRoutes = require('./routes/catalogoRoutes'); // Importar rutas de catálogo

// Middlewares
app.use(express.json());
app.use(cors());
app.use(helmet());
app.use(morgan('dev'));

// Routes
app.get('/', (req, res) => {
    res.send('API de Batería de Riesgo Psicosocial funcionando');
});

// Rutas de la API
app.use('/api/auth', authRoutes);
app.use('/api', usuariosRoutes);
app.use('/api', empresasRoutes);
app.use('/api', rolesRoutes);
app.use('/api', formDatosGeneralesRoutes); // Ruta de datos generales
app.use('/api/catalogos', catalogoRoutes); // Rutas de catálogos
app.use('/api/estres/preguntas', estresPreguntasRoutes);
app.use('/api/estres/respuestas', estresRespuestasRoutes);

// Comprobar que las rutas están registradas correctamente
app._router.stack.forEach((r) => {
    if (r.route && r.route.path) {
        console.log(`📌 Ruta registrada: ${Object.keys(r.route.methods).join(', ').toUpperCase()} ${r.route.path}`);
    }
});

// Crear un usuario administrador por defecto si no existe, para parametrizar la base de datos
const crearAdminDefault = async () => {
    try {
        const idAdminDefecto = '1'; // ID del rol de administrador por defecto
        
        // Establecer el usuario autenticado como el que está haciendo la consulta, para identificar
        // quien ejecuta acciones y registrarlo en la tabla de logs
        await promisePool.execute('SET @usuario_actual = ?', [idAdminDefecto]); // Establecer el usuario autenticado
        
        const [rows] = await promisePool.execute(
            "SELECT COUNT(*) as total FROM usuarios WHERE rol_id = '1'"
        );

        if (rows[0].total === 0) {
            console.log('⚠ No hay administrador. Creando usuario por defecto...');
            
            const password = 'admin123'; // Cambia esta contraseña según necesites
            const salt = await bcryptjs.genSalt(10);
            const hashedPassword = await bcryptjs.hash(password, salt);

            await promisePool.execute(
                "INSERT INTO usuarios (nombre, email, contrasena, rol_id, empresa_id) VALUES (?, ?, ?, ?, ?)",
                ['AdminGeneral', 'admin@sistema.com', hashedPassword, '1', '1']
            );

            console.log('✅ Usuario administrador creado: admin@sistema.com / admin123');
        } else {
            console.log('✅ Usuario administrador ya existe.');
        }
    } catch (error) {
        console.error('❌ Error al crear usuario administrador:', error);
    }
};

// Iniciar el servidor
const PORT = process.env.SERVER_PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
    console.log('API de Batería de Riesgo Psicosocial funcionando');
});

// Llamar la función al iniciar el servidor
crearAdminDefault();
