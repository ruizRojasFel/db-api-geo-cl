-- SERIAL (INT 4 bytes): soporta hasta ~2.100 millones de registros.
-- Suficiente para tablas con datos fijos o de crecimiento acotado
-- como regiones, provincias y comunas de Chile.

CREATE TABLE region (
    id      SERIAL PRIMARY KEY,
    numero  VARCHAR(5)  NOT NULL,  -- Número romano: "I", "XIII", "XVI"
    nombre  VARCHAR(100) NOT NULL,
    capital VARCHAR(100) NOT NULL
);
CREATE TABLE provincia (
    id        SERIAL PRIMARY KEY,
    nombre    VARCHAR(100) NOT NULL,
    capital   VARCHAR(100) NOT NULL,
    region_id INT NOT NULL REFERENCES region(id)
);
CREATE TABLE comuna (
    id           SERIAL PRIMARY KEY,
    nombre       VARCHAR(100) NOT NULL,
    codigo_cut   VARCHAR(10)  NOT NULL UNIQUE,
    provincia_id INT NOT NULL REFERENCES provincia(id)
); 