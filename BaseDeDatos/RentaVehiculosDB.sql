CREATE DATABASE RentaVehiculosDB;
GO
USE RentaVehiculosDB;
GO

CREATE TABLE Usuarios (
    IdUsuario      INT IDENTITY(1,1) PRIMARY KEY,
    NombreUsuario  NVARCHAR(50) NOT NULL UNIQUE,
    Clave          NVARCHAR(50) NOT NULL
);

CREATE TABLE Vehiculos (
    IdVehiculo      INT IDENTITY(1,1) PRIMARY KEY,
    Placa           NVARCHAR(10)  NOT NULL UNIQUE,
    Marca           NVARCHAR(50)  NOT NULL,
    Modelo          NVARCHAR(50)  NOT NULL,
    Tipo            NVARCHAR(20)  NOT NULL CHECK (Tipo IN ('AutoDeportivo', 'Jeepeta')),
    PrecioPorDia    DECIMAL(10,2) NOT NULL CHECK (PrecioPorDia > 0),
    Estado          NVARCHAR(20)  NOT NULL DEFAULT 'Disponible'
                    CHECK (Estado IN ('Disponible', 'Rentado', 'Mantenimiento')),
    CaballosFuerza  INT NULL,
    Tiene4x4        BIT NULL
);

CREATE TABLE Clientes (
    IdCliente            INT IDENTITY(1,1) PRIMARY KEY,
    Nombre               NVARCHAR(100) NOT NULL,
    Cedula               NVARCHAR(15)  NOT NULL UNIQUE,
    Licencia             NVARCHAR(20)  NOT NULL UNIQUE,
    VencimientoCedula    DATE NOT NULL,
    VencimientoLicencia  DATE NOT NULL
);

CREATE TABLE Reservas (
    IdReserva        INT IDENTITY(1,1) PRIMARY KEY,
    IdVehiculo       INT NOT NULL FOREIGN KEY REFERENCES Vehiculos(IdVehiculo),
    IdCliente        INT NOT NULL FOREIGN KEY REFERENCES Clientes(IdCliente),
    FechaInicio      DATE NOT NULL,
    FechaFinPactada  DATE NOT NULL,
    FechaDevolucion  DATE NULL,
    Dias             INT NOT NULL CHECK (Dias BETWEEN 1 AND 30),
    Total            DECIMAL(10,2) NOT NULL,
    Recargo          DECIMAL(10,2) NOT NULL DEFAULT 0
);

CREATE TABLE Depositos (
    IdDeposito     INT IDENTITY(1,1) PRIMARY KEY,
    IdReserva      INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Reservas(IdReserva),
    Monto          DECIMAL(10,2) NOT NULL,
    MontoDevuelto  DECIMAL(10,2) NULL,
    FechaDeposito  DATE NOT NULL
);
GO

INSERT INTO Usuarios (NombreUsuario, Clave)
VALUES ('Logan', '062606');
GO
