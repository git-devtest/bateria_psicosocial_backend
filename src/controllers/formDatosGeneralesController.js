const { promisePool } = require('../config/db');
const responses = require('../utils/responses');

const crearFichaDatosGenerales = async (req, res) => {
  const {
        evaluacion_id,
        ciudad_trabajo,
        depto_trabajo,
        anios_empresa_menos_1,
        anios_empresa_mas_1,
        cargo_actual,
        tipo_cargo_id,
        nombre_area_seccion,
        tipo_contrato_id,
        horas_diarias,
        tipo_salario_id
  } = req.body;

  try {
    const [result] = await promisePool.query(`
      INSERT INTO form_datos_generales (
        evaluacion_id,
        ciudad_trabajo,
        depto_trabajo,
        anios_empresa_menos_1,
        anios_empresa_mas_1,
        cargo_actual,
        tipo_cargo_id,
        nombre_area_seccion,
        tipo_contrato_id,
        horas_diarias,
        tipo_salario_id
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        evaluacion_id,
        ciudad_trabajo,
        depto_trabajo,
        anios_empresa_menos_1,
        anios_empresa_mas_1,
        cargo_actual,
        tipo_cargo_id,
        nombre_area_seccion,
        tipo_contrato_id,
        horas_diarias,
        tipo_salario_id
      ]
    );

    responses.created(res, 'Ficha de datos generales creada correctamente', { id: result.insertId, ...req.body });
    console.log('✅ Ficha de datos generales creada correctamente:', { id: result.insertId, ...req.body });
  } catch (error) {
    console.error('❌ Error al crear ficha de datos generales:', error);
    responses.error(res, 'Error al crear ficha de datos generales');
  }
};

module.exports = { crearFichaDatosGenerales };
