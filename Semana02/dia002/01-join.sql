-- Creaando la BD
CREATE DATABASE comercio;

\c comercio;

-- Creaando la tabla clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    ruc TEXT
);

-- Creando la tabla productos
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio_unitario FLOAT,
    disponible BOOLEAN
);

-- Creaando la tabla pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    producto_id INT REFERENCES productos(id),
    cantidad INT NOT NULL,
    precio FLOAT
);

-- Insertando datos en la tabla clientes
INSERT INTO clientes (nombre, ruc) VALUES
('los chocheras', '10674885762'),
('transp margarita', '10586784952'),
('los visionarios SAC', '10697895362');

-- Insertando datos en la tabla productos
INSERT INTO productos (nombre, precio_unitario, disponible) VALUES
('galletas de vainilla', 4.5, true),
('gaseosa 1lt', 5.4, true),
('chichazara', 2.2, true),
('melones', 4.2, false);

-- Insertando datos en la tabla pedidos
INSERT INTO pedidos (cliente_id, producto_id, cantidad, precio) VALUES
(1, 1, 10, 45),
(1, 2, 5, 27),
(2, 3, 3, 6.6),
(2, 1, 5, 22.5);
-- Consultas
-- TODOS LOS PEDIDOS DEL CLIENTE 1
SELECT * FROM pedidos WHERE cliente_id = 1;

-- Los productos que tienen pedidos
SELECT DISTINCT p.* FROM productos p
INNER JOIN pedidos pe ON p.id = pe.producto_id;

-- Qué productos no tienen pedidos
SELECT * FROM productos p
LEFT JOIN pedidos pe ON p.id = pe.producto_id
WHERE pe.id IS NULL;

-- Qué productos ha comprado el cliente número 1
SELECT pr.* FROM productos pr
INNER JOIN pedidos pe ON pr.id = pe.producto_id
WHERE pe.cliente_id = 1;

-- Listar los estudiantes con los cursos en los que están inscritos:
SELECT e.id AS estudiante_id, e.nombre AS estudiante, 
       c.id AS curso_id, c.nombre AS curso
FROM estudiantes e
JOIN inscripciones i ON e.id = i.estudiante_id
JOIN cursos c ON i.curso_id = c.id;

-- Mostrar todos los estudiantes, incluyendo aquellos que no están inscritos en ningún curso:
SELECT e.id AS estudiante_id, e.nombre AS estudiante, 
       c.id AS curso_id, c.nombre AS curso
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id = i.estudiante_id
LEFT JOIN cursos c ON i.curso_id = c.id;

-- Mostrar todos los cursos y los estudiantes que están inscritos en ellos:
SELECT c.id AS curso_id, c.nombre AS curso, 
       e.id AS estudiante_id, e.nombre AS estudiante
FROM cursos c
LEFT JOIN inscripciones i ON c.id = i.curso_id
LEFT JOIN estudiantes e ON i.estudiante_id = e.id;
