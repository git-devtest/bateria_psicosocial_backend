// utils/responses.js

const ok =              (res, data) => res.status(200).json(data);
const created =         (res, data) => res.status(201).json(data);
const badRequest =      (res, message = 'Solicitud incorrecta') => res.status(400).json({ error: message });
const unauthorized =    (res, message = 'No autorizado') => res.status(401).json({ error: message });
const forbidden =       (res, message = 'Acceso denegado') => res.status(403).json({ error: message });
const notFound =        (res, message = 'Recurso no encontrado') => res.status(404).json({ error: message });
const conflict =        (res, message = 'Conflicto') => res.status(409).json({ error: message });
const error =           (res, message = 'Error interno del servidor') => res.status(500).json({ error: message });

module.exports = { ok, created, badRequest, unauthorized, forbidden, notFound, conflict, error  };
