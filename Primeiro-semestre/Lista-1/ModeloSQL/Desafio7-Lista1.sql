CREATE DATABASE Desafio7Lista1

USE Desafio7Lista1

CREATE TABLE Combustivel(
	cd_Combustivel INT IDENTITY(1,1),
	nm_Combustivel VARCHAR(30) NOT NULL,
	abr_Combustivel VARCHAR(10) NOT NULL,
	CONSTRAINT pk_Combustivel PRIMARY KEY(cd_Combustivel)
)

CREATE TABLE TipoModelo(
	cd_TipoModelo INT IDENTITY(1,1),
	ds_TipoModelo VARCHAR(30) NOT NULL,
	CONSTRAINT pk_TipoModelo PRIMARY KEY(cd_TipoModelo)
)

CREATE TABLE Pais(
	cd_Pais INT IDENTITY(1,1),
	nm_Pais VARCHAR(20) NOT NULL,
	CONSTRAINT pk_Pais PRIMARY KEY(cd_Pais)
)

CREATE TABLE Marca(
	cd_Marca INT IDENTITY(1,1),
	nm_Marca VARCHAR(20) NOT NULL,
	abr_Marca VARCHAR(10) NOT NULL,
	CONSTRAINT pk_Marca PRIMARY KEY(cd_Marca)
)

CREATE TABLE Modelo(
	cd_Modelo INT IDENTITY(1,1),
	nm_Modelo VARCHAR(30) NOT NULL,
	vlr_AnoModelo INT NOT NULL,
	vlr_PotenciaMotorModelo DECIMAL(2,1) NOT NULL,
	cd_CombustivelModelo INT NOT NULL,
	cd_TipoModelo INT NOT NULL,
	cd_MarcaModelo INT NOT NULL,
	CONSTRAINT pk_Modelo PRIMARY KEY(cd_Modelo),
	CONSTRAINT fk_Combustivel FOREIGN KEY(cd_CombustivelModelo) REFERENCES Combustivel(cd_Combustivel),
	CONSTRAINT fk_TipoModelo FOREIGN KEY(cd_TipoModelo) REFERENCES TipoModelo(cd_TipoModelo),
	CONSTRAINT fk_Marca FOREIGN KEY(cd_MarcaModelo) REFERENCES Marca(cd_Marca)
)

-- INSERÇÕES NAS TABELAS ----------------------

INSERT INTO Combustivel (nm_Combustivel, abr_Combustivel) VALUES
('Gasolina', 'GAS'),
('Etanol', 'ETA'),
('Diesel', 'DSL'),
('Flex', 'FLX')

INSERT INTO TipoModelo (ds_TipoModelo) VALUES
('Hatch'),
('Sedan')

INSERT INTO Pais (nm_Pais) VALUES
('Brasil'),
('Japão')

INSERT INTO Marca (nm_Marca, abr_Marca) VALUES
('Fiat', 'FIAT'),
('Volkswagen', 'VW')

INSERT INTO Modelo (nm_Modelo, vlr_AnoModelo, vlr_PotenciaMotorModelo,cd_CombustivelModelo, cd_TipoModelo, cd_MarcaModelo) 
VALUES
('Uno', 2020, 1.0, 4, 1, 1),
('Gol', 2021, 1.6, 4, 1, 2)

SELECT * FROM Combustivel
SELECT * FROM TipoModelo
SELECT * FROM Marca
SELECT * FROM Modelo
