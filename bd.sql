CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE IF NOT EXISTS libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR (100) NOT NULL,
    autor VARCHAR (100) NOT NULL,
    anio_publicacion INT,
    genero VARCHAR (100),
    cantidad_disponible INT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS usuarios(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100) NOT NULL,
    apellido VARCHAR (100) NOT NULL,
    correo VARCHAR (100) UNIQUE NOT NULL,
    telefono VARCHAR (20)
);

CREATE TABLE IF NOT EXISTS prestamos(
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_libro INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

INSERT INTO libros(titulo, autor, anio_publicacion, genero, cantidad_disponible) VALUES
('Cien años de soledad', 'Gabriel García Márquez', 1967, 'Realismo mágico', 3),
('1984', 'George Orwell', 1949, 'Distopía', 5),
('El principito', 'Antoine de Saint-Exupéry', 1943, 'Fábula', 2);

INSERT INTO usuarios(nombre, apellido, correo, telefono) VALUES 
('Juan', 'Perez', 'juan@gmail.com', '3001234567' ),
('Maria', 'Lopez', 'maria@gmail.com', '3109876543'),
('Hector', 'Rodriguez', 'hector@gmail.com', '3158452342');

INSERT INTO prestamos(id_usuario, id_libro, fecha_prestamo, fecha_devolucion) VALUES
(1, 2, CURDATE(), NULL),
(2, 3, '2025-03-01', '2025-03-15');
