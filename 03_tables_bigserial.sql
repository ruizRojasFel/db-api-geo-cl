-- BIGSERIAL (BIGINT 8 bytes): soporta hasta ~9.200 billones de registros.
-- Recomendado para tablas que pueden escalar masivamente
-- o cuando la API se extiende a otros países.

CREATE TABLE region (
    id BIGSERIAL PRIMARY KEY,
    numero VARCHAR(5) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    capital VARCHAR(100) NOT NULL
);
CREATE TABLE provincia (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    capital VARCHAR(100) NOT NULL,
    region_id BIGINT NOT NULL REFERENCES region(id)
);
CREATE TABLE comuna (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo_cut VARCHAR(10) NOT NULL UNIQUE,
    provincia_id BIGINT NOT NULL REFERENCES provincia(id)
);