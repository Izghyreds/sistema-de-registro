CREATE DATABASE peliculas;
USE peliculas;

CREATE TABLE CLIENTE (
    ClienteCodigo INT PRIMARY KEY,
    ClienteNombre VARCHAR(100),
    ClienteDireccion VARCHAR(150),
    ClienteTelefono VARCHAR(20),
    ClienteCodigoAval INT
);

CREATE TABLE DIRECTOR (
    DirectorCodigo INT PRIMARY KEY,
    DirectorNombre VARCHAR(100),
    DirectorFechaNac DATE,
    DirectorSexo CHAR(1),
    DirectorNac VARCHAR(50)
);

CREATE TABLE ACTOR (
    ActorCodigo INT PRIMARY KEY,
    ActorNombre VARCHAR(100),
    ActorFechaNac DATE,
    ActorSexo CHAR(1),
    ActorNacionalidad VARCHAR(50)
);

CREATE TABLE PELICULA (
    PeliculaCodigo INT PRIMARY KEY,
    PeliculaTitulo VARCHAR(100),
    PeliculaNacional VARCHAR(50),
    PeliculaProductora VARCHAR(100),
    PeliculaFecha DATE,
    PeliculaDirector INT,
    FOREIGN KEY (PeliculaDirector) REFERENCES DIRECTOR(DirectorCodigo)
);

CREATE TABLE REPARTO (
    PeliculaCodigo INT,
    PeliculaActor INT,
    TipoPapel VARCHAR(50),
    PRIMARY KEY (PeliculaCodigo, PeliculaActor),
    FOREIGN KEY (PeliculaCodigo) REFERENCES PELICULA(PeliculaCodigo),
    FOREIGN KEY (PeliculaActor) REFERENCES ACTOR(ActorCodigo)
);

CREATE TABLE EJEMPLAR (
    EjemplarCodigo INT PRIMARY KEY,
    PeliculaCodigo INT,
    EjemplarEstado VARCHAR(50),
    EjemplarFechaIngr DATE,
    EstadoConserva VARCHAR(50),
    FOREIGN KEY (PeliculaCodigo) REFERENCES PELICULA(PeliculaCodigo)
);

CREATE TABLE ALQUILER (
    NumeroAlquiler INT PRIMARY KEY,
    AlquilerFecha DATE,
    ClienteCodigo INT,
    Total DECIMAL(10,2),
    FOREIGN KEY (ClienteCodigo) REFERENCES CLIENTE(ClienteCodigo)
);

CREATE TABLE DETALLE_ALQUILER (
    EjemplarCodigo INT,
    NumeroAlquiler INT,
    Precio DECIMAL(10,2),
    PRIMARY KEY (EjemplarCodigo, NumeroAlquiler),
    FOREIGN KEY (EjemplarCodigo) REFERENCES EJEMPLAR(EjemplarCodigo),
    FOREIGN KEY (NumeroAlquiler) REFERENCES ALQUILER(NumeroAlquiler)
);

-- DATOS

INSERT INTO CLIENTE VALUES 
(1, 'Ana Gómez', 'Calle 123', '3001234567', NULL),
(2, 'Luis Torres', 'Cra 45 #67-89', '3017654321', 1),
(3, 'Marta López', 'Av. Siempre Viva 742', '3029876543', 2),
(4, 'Claudia Hernández', 'Calle Falsa 123', '3034445566', NULL);

INSERT INTO DIRECTOR VALUES 
(1, 'Pedro Almodóvar', '1950-09-25', 'M', 'España'),
(2, 'Sofía Coppola', '1971-05-14', 'F', 'EEUU'),
(3, 'Alfred Hitchcock', '1899-08-13', 'M', 'Reino Unido');

INSERT INTO ACTOR VALUES 
(1, 'Tom Hanks', '1956-07-09', 'M', 'EEUU'),
(6, 'Will Smith', '1968-09-25', 'M', 'EEUU'),
(2, 'Emma Watson', '1990-04-15', 'F', 'Reino Unido'),
(3, 'Javier Bardem', '1969-03-01', 'M', 'España'),
(4, 'Humphrey Bogart', '1899-12-25', 'M', 'EEUU'),
(5, 'Ingrid Bergman', '1915-08-29', 'F', 'Suecia');

INSERT INTO PELICULA VALUES 
(101, 'El Laberinto del Fauno', 'México', 'Telecinco Cinema', '2006-10-11', 1),
(102, 'Perdidos en Tokio', 'EEUU', 'Focus Features', '2003-09-18', 2),
(103, 'Psicosis', 'EEUU', 'Paramount Pictures', '1960-06-16', 3),
(108, '1917', 'Reino Unido', 'DreamWorks', '2019-12-25', 1),
(107, 'Hombres de Negro', 'EEUU', 'Columbia Pictures', '1997-07-02', 2),
(105, 'Titanic', 'EEUU', '20th Century Fox', '1997-12-19', 2),
(104, 'Los Pájaros', 'EEUU', 'Universal Pictures', '1963-03-28', 3),
(106, 'Casa Blanca', 'EEUU', 'Warner Bros', '1942-11-26', 1);

INSERT INTO REPARTO VALUES 
(101, 3, 'Protagonista'),
(102, 2, 'Protagonista'),
(102, 1, 'Secundario'),
(107, 6, 'Protagonista'),
(106, 4, 'Protagonista'),
(106, 5, 'Protagonista');

INSERT INTO EJEMPLAR VALUES 
(1, 101, 'Disponible', '2022-01-01', 'Buena'),
(2, 101, 'Alquilado', '2022-05-10', 'Regular'),
(3, 102, 'Disponible', '2023-02-15', 'Excelente'),
(4, 105, 'Disponible', '2023-01-10', 'Buena'),
(5, 105, 'Alquilado', '2023-05-15', 'Regular'),
(7, 107, 'Disponible', '2023-06-01', 'Buena'),
(6, 105, 'Disponible', '2024-01-05', 'Buena');

INSERT INTO ALQUILER VALUES 
(1001, '2024-06-01', 1, 15000),
(1005, '2020-03-15', 2, 8000),
(1002, '2024-06-05', 2, 10000),
(1003, '2024-03-10', 4, 20000),
(1006, '2024-06-01', 1, 6000),
(1007, '2024-06-02', 2, 6000),
(1008, '2024-06-03', 3, 6000),
(1004, '2024-05-02', 4, 15000);

INSERT INTO DETALLE_ALQUILER VALUES 
(1, 1001, 8000),
(4, 1006, 6000),
(5, 1007, 6000),
(6, 1008, 6000),
(2, 1001, 7000),
(1, 1005, 8000),
(3, 1002, 10000);