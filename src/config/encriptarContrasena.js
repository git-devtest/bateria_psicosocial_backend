const bcrypt = require('bcryptjs');

const contrasena = ''; // Cambia esta contraseña según necesites

const encriptarContrasena = async (contrasena) => {
    try {
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(contrasena, salt);
        console.log('✅ Contraseña encriptada:', hashedPassword);
        return hashedPassword;
    } catch (error) {
        console.error('Error al encriptar la contraseña:', error);
        throw new Error('Error al encriptar la contraseña');
    }
}

encriptarContrasena(contrasena);