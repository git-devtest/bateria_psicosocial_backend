const { promisePool } = require('../config/db');
const responses = require('../utils/responses');

// Guardar múltiples respuestas de estrés
const guardarRespuestas = async (req, res) => {
    console.log('📥 Guardando respuestas de estrés...');
    const { id_formulario, respuestas } = req.body;

    if (!Array.isArray(respuestas) || respuestas.length === 0) {
        return responses.error(res, 'Debe enviar un arreglo de respuestas');
    }

    try {
        // Verificar que el formulario exista
        const [form] = await promisePool.query('SELECT id FROM form_datos_generales WHERE id = ?', [id_formulario]);
        if (form.length === 0) return responses.notFound(res, 'Formulario no encontrado');

        // Preparar datos para inserción
        const valores = respuestas.map(r => [id_formulario, r.id_pregunta, r.id_opcion_respuesta]);
        const sql = 'INSERT INTO estres_respuestas (id_formulario, id_pregunta, id_opcion_respuesta) VALUES ?';

        await promisePool.query(sql, [valores]);

        responses.created(res, { message: 'Respuestas guardadas correctamente' });
    } catch (error) {
        console.error('❌ Error al guardar respuestas:', error);
        responses.error(res, 'Error al guardar respuestas');
    }
};

// Obtener respuestas por evaluación
const obtenerRespuestasPorFormulario = async (req, res) => {
    console.log('📥 Obteniendo respuestas de estrés por formulario...');
    const { id_formulario } = req.params;

    try {
        const [respuestas] = await promisePool.query(
            `SELECT er.id, er.id_formulario, ep.descripcion AS pregunta, eor.etiqueta AS respuesta
             FROM estres_respuestas er
             JOIN estres_preguntas ep ON er.id_pregunta = ep.id
             JOIN estres_opciones_respuesta eor ON er.id_opcion_respuesta = eor.id
             WHERE er.id_formulario = ?
             ORDER BY ep.id`,
            [id_formulario]
        );

        if (respuestas.length === 0) return responses.notFound(res, 'No se encontraron respuestas para este formulario');

        responses.ok(res, respuestas);
    } catch (error) {
        console.error('❌ Error al obtener respuestas:', error);
        responses.error(res, 'Error al obtener respuestas');
    }
};

module.exports = {
    guardarRespuestas,
    obtenerRespuestasPorFormulario
};
