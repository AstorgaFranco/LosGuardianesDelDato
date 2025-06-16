
-- CREACIÓN DE TABLAS PARA FARMACIA

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    dni VARCHAR(20),
    telefono VARCHAR(20),
    direccion VARCHAR(100)
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    dni VARCHAR(20),
    puesto VARCHAR(50)
);

CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(50),
    direccion VARCHAR(100)
);

CREATE TABLE Medicamento (
    id_medicamento INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2),
    stock INT,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

CREATE TABLE Venta (
    id_venta INT PRIMARY KEY,
    fecha DATE,
    id_cliente INT,
    id_empleado INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE DetalleVenta (
    id_detalle INT PRIMARY KEY,
    id_venta INT,
    id_medicamento INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento)
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY,
    nombre VARCHAR(50),
    especialidad VARCHAR(100),
    matricula VARCHAR(50)
);

CREATE TABLE Receta (
    id_receta INT PRIMARY KEY,
    fecha DATE,
    indicaciones TEXT,
    id_cliente INT,
    id_medico INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);

CREATE TABLE DetalleReceta (
    id_detalle_receta INT PRIMARY KEY,
    id_receta INT,
    id_medicamento INT,
    dosis VARCHAR(50),
    frecuencia VARCHAR(50),
    FOREIGN KEY (id_receta) REFERENCES Receta(id_receta),
    FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento)
);
