const { promisePool } = require('../config/db');
const responses = require('../utils/responses');

// Obtener todas las preguntas
const obtenerPreguntas = async (req, res) => {
    console.log('Obteniendo preguntas de estrés...');
    try {
        const [preguntas] = await promisePool.query('SELECT * FROM estres_preguntas');
        responses.ok( res, preguntas );
    } catch (error) {
        console.error('Error al obtener preguntas de estrés:', error);
        responses.error( res, 'Error al obtener preguntas' );
    }
};

// Obtener una pregunta por ID
const obtenerPreguntaPorId = async (req, res) => {
    console.log('Obteniendo pregunta de estrés por ID...');
    const { id } = req.params;

    try {
        const [pregunta] = await promisePool.query('SELECT * FROM estres_preguntas WHERE id = ?', [id]);

        if (pregunta.length === 0) {
            return responses.notFound( res, 'Pregunta no encontrada' );
        }

        responses.ok( res, pregunta[0] );
    } catch (error) {
        console.error('Error al obtener la pregunta:', error);
        responses.error( res, 'Error al obtener pregunta' );
    }
};

// Exportamos los módulos
module.exports = {
    obtenerPreguntas,
    obtenerPreguntaPorId,
};