CREATE DATABASE IF NOT EXISTS TiendaInformatica;
USE TiendaInformatica;

-- 1. Tabla de Productos
CREATE TABLE Producto (
    codigo_producto INT PRIMARY KEY,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2),
    stock INT
);

-- 2. Tabla de Clientes
CREATE TABLE Cliente (
    codigo_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20)
);

-- 3. Tabla de Proveedores
CREATE TABLE Proveedor (
    codigo_proveedor INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    direccion VARCHAR(150),
    provincia VARCHAR(50),
    telefono VARCHAR(20)
);

-- 4. Tabla de Compras (Relación N:M entre Cliente y Producto)
CREATE TABLE Compra (
    id_compra INT PRIMARY KEY AUTO_INCREMENT,
    codigo_cliente INT,
    codigo_producto INT,
    fecha_compra DATE,
    FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo_cliente),
    FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo_producto)
);

-- 5. Tabla de Suministro (Relación N:M entre Proveedor y Producto)
CREATE TABLE Suministra (
    codigo_proveedor INT,
    codigo_producto INT,
    PRIMARY KEY (codigo_proveedor, codigo_producto),
    FOREIGN KEY (codigo_proveedor) REFERENCES Proveedor(codigo_proveedor),
    FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo_producto)
);