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
    Tiene4x4        BIT NULL,
    Activo          BIT NOT NULL DEFAULT 1,
    CONSTRAINT CK_Vehiculos_Dato CHECK (
        (Tipo = 'AutoDeportivo' AND CaballosFuerza IS NOT NULL AND CaballosFuerza > 0 AND Tiene4x4 IS NULL)
        OR (Tipo = 'Jeepeta' AND Tiene4x4 IS NOT NULL AND CaballosFuerza IS NULL))
);

CREATE TABLE Clientes (
    IdCliente            INT IDENTITY(1,1) PRIMARY KEY,
    Nombre               NVARCHAR(100) NOT NULL,
    Cedula               NVARCHAR(15)  NOT NULL UNIQUE,
    Licencia             NVARCHAR(20)  NOT NULL UNIQUE,
    VencimientoCedula    DATE NOT NULL,
    VencimientoLicencia  DATE NOT NULL,
    CONSTRAINT CK_Clientes_Cedula CHECK (LEN(Cedula) = 11 AND Cedula NOT LIKE '%[^0-9]%'),
    CONSTRAINT CK_Clientes_Licencia CHECK (
        Licencia LIKE '[A-Za-z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
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
    Recargo          DECIMAL(10,2) NOT NULL DEFAULT 0,
    Estado           NVARCHAR(20) NOT NULL DEFAULT 'Activa'
                     CHECK (Estado IN ('Activa', 'Devuelta', 'Cancelada')),
    DiasRetraso      INT NOT NULL DEFAULT 0,
    CONSTRAINT CK_Reservas_Fechas CHECK (FechaFinPactada > FechaInicio),
    CONSTRAINT CK_Reservas_Dias CHECK (DATEDIFF(DAY, FechaInicio, FechaFinPactada) = Dias),
    CONSTRAINT CK_Reservas_Devolucion CHECK (FechaDevolucion IS NULL OR FechaDevolucion >= FechaInicio),
    CONSTRAINT CK_Reservas_Montos CHECK (Total > 0 AND Recargo >= 0),
    CONSTRAINT CK_Reservas_Retraso CHECK (
        DiasRetraso = CASE
            WHEN FechaDevolucion IS NULL THEN 0
            WHEN DATEDIFF(DAY, FechaFinPactada, FechaDevolucion) > 0 THEN DATEDIFF(DAY, FechaFinPactada, FechaDevolucion)
            ELSE 0 END)
);

CREATE TABLE Depositos (
    IdDeposito     INT IDENTITY(1,1) PRIMARY KEY,
    IdReserva      INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Reservas(IdReserva),
    Monto          DECIMAL(10,2) NOT NULL,
    MontoDevuelto  DECIMAL(10,2) NULL,
    FechaDeposito  DATE NOT NULL,
    CONSTRAINT CK_Depositos_Montos CHECK (
        Monto > 0 AND (MontoDevuelto IS NULL OR (MontoDevuelto >= 0 AND MontoDevuelto <= Monto)))
);

CREATE TABLE Pagos (
    IdPago     INT IDENTITY(1,1) PRIMARY KEY,
    IdReserva  INT NOT NULL FOREIGN KEY REFERENCES Reservas(IdReserva),
    Concepto   NVARCHAR(20)  NOT NULL CHECK (Concepto IN ('Alquiler', 'Recargo')),
    Monto      DECIMAL(10,2) NOT NULL CHECK (Monto > 0),
    FechaPago  DATE NOT NULL
);
GO

INSERT INTO Usuarios (NombreUsuario, Clave)
VALUES ('Logan', '062606');
GO
