CREATE DATABASE IF NOT EXISTS SistemaLogistica;
USE SistemaLogistica;

-- 1. Tabla de Provincias
CREATE TABLE Provincia (
    cod_provincia INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- 2. Tabla de Camioneros
CREATE TABLE Camionero (
    cedula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    salario DECIMAL(10,2) NOT NULL,
    poblacion VARCHAR(100)
);

-- 3. Tabla de Paquetes
CREATE TABLE Paquete (
    cod_paquete INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    destinatario VARCHAR(150) NOT NULL,
    direccion_destinatario VARCHAR(255) NOT NULL,
    cedula_camionero VARCHAR(20),
    cod_provincia INT,
    FOREIGN KEY (cedula_camionero) REFERENCES Camionero(cedula),
    FOREIGN KEY (cod_provincia) REFERENCES Provincia(cod_provincia)
);

-- 4. Tabla de Camiones
CREATE TABLE Camion (
    matricula VARCHAR(20) PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    potencia VARCHAR(30)
);

-- 5. Tabla Intermedia: Registro de Conducción (Relación N:M)
-- Guarda el historial de qué camionero condujo qué camión y en qué día
CREATE TABLE Conduce (
    cedula_camionero VARCHAR(20),
    matricula_camion VARCHAR(20),
    fecha DATE NOT NULL,
    PRIMARY KEY (cedula_camionero, matricula_camion, fecha),
    FOREIGN KEY (cedula_camionero) REFERENCES Camionero(cedula),
    FOREIGN KEY (matricula_camion) REFERENCES Camion(matricula)
);