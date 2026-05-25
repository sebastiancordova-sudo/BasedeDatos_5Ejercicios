CREATE DATABASE IF NOT EXISTS TiendaDiscos;
USE TiendaDiscos;

-- 1. Tabla de Géneros Musicales
CREATE TABLE Genero_Musical (
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nombre_genero VARCHAR(50) NOT NULL
);

-- 2. Tabla de Cantantes
CREATE TABLE Cantante (
    id_cantante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);

-- 3. Tabla de Discos
CREATE TABLE Disco (
    id_disco INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_genero INT,
    id_cantante INT,
    FOREIGN KEY (id_genero) REFERENCES Genero_Musical(id_genero),
    FOREIGN KEY (id_cantante) REFERENCES Cantante(id_cantante)
);

-- 4. Tabla de Canciones
CREATE TABLE Cancion (
    id_cancion INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL
);

-- 5. Tabla Intermedia: Contenido de los Discos (Relación N:M)
-- Aquí se incluye la 'posicion' de la canción específica en ese disco
CREATE TABLE Disco_Cancion (
    id_disco INT,
    id_cancion INT,
    posicion INT NOT NULL,
    PRIMARY KEY (id_disco, id_cancion),
    FOREIGN KEY (id_disco) REFERENCES Disco(id_disco),
    FOREIGN KEY (id_cancion) REFERENCES Cancion(id_cancion)
);