nombre = 'Eduardo'
print(type(nombre))
nombre = 30
print(type(nombre))
nombre = False
print(type(nombre))
nombre = 10.5

# Necesario para la programacion porque sirve como ayuda a otros programadores a entender el funcionamiento

# Para imprimir por consola en Python
print('Hola mundo')
print(nombre)

# Para saber el tipo de variable
print(type(nombre))

texto = "Buenas noches con todos Brian O'Conner"
texto = '"Buenas noches con todos" Dijo Abigail'

otro_texto = "Y eduardo dijo: \"Hola amigos!\""

print(otro_texto)


# Triple comilla simple o comilla doble
parrafo = '''hola, yo me llamo Lalo y 
 lo que voy a contar ahora es una historia'''

print(parrafo)

otro_parrafo = """ahora, les voy a contar una historia.
Todo comenzo en el año 2020 ...."""

curso, mes, dia, habilitado, nota = 'Backend', 'Marzo', 20, False, 13

print(curso)


CREATE DATABASE colegio;

\c colegio;

CREATE TABLE alumnos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido_paterno TEXT,
    apellido_materno TEXT,
    correo TEXT UNIQUE NOT NULL,
    exonerado BOOLEAN DEFAULT FALSE,
    fecha_matricula TIMESTAMP NOT NULL
);

INSERT INTO alumnos (nombre, apellido_paterno, apellido_materno, correo, exonerado, fecha_matricula) VALUES
('eduardo', 'perez', 'marquina', 'eperez@gmail.com', false, '2018-01-13'),
('lucia', 'martinez', 'perez', 'lmartinez@gmail.com', false, '2020-03-04'),
('roberto', 'manrique', 'vizcarra', 'rmanrique@hotmail.com', true, '2021-02-01'),
('ivan', 'yucra', 'perez', 'iyucra@hotmail.com', false, '2023-07-18'),
('daniela', 'soncco', NULL, 'dsoncoo@yahoo.com', true, '2019-05-14');