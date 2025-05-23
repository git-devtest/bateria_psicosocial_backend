const express = require('express');
const { register, login, getProfile } = require('../controllers/authController');
const auth = require('../middlewares/auth');

const router = express.Router();

router.post('/register', register);
router.post('/', login);
router.post('/login', login);
router.get('/perfil', auth(), getProfile);   // Middleware para proteger la ruta de perfil

module.exports = router;