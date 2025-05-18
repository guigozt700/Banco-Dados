-- GUILHERME GOMES DA SILVA

-- Problema 6 Lista 1 ---------------------------------------------------

CREATE DATABASE Desafio6Lista1

USE Desafio6Lista1

CREATE TABLE Genero(
	cd_Genero INT NOT NULL IDENTITY(1,1),
	ds_Genero VARCHAR(15) NOT NULL,
	abr_Genero CHAR(1) NOT NULL,
	CONSTRAINT pk_Genero PRIMARY KEY(cd_Genero)
)

CREATE TABLE OrgaoEmissorRG(
	cd_OrgaoEmissorRG INT NOT NULL IDENTITY(1,1),
	ds_OrgaoEmissorRG VARCHAR(40) NOT NULL,
	abr_OrgaoEmissorRG VARCHAR(10) NOT NULL,
	CONSTRAINT pk_OrgaoEmissorRG PRIMARY KEY(cd_OrgaoEmissorRG)
)

CREATE TABLE Departamento(
	cd_Departamento INT IDENTITY(1,1),
	nm_Departamento VARCHAR(30) NOT NULL,
	abr_Departamento VARCHAR(5) NOT NULL,
	cd_FuncionarioGerente INT NULL,      -- Fica vazia pra ser alterado depois (a tabela funcionario é criada depois)
	CONSTRAINT pk_Departamento PRIMARY KEY(cd_Departamento)
)

CREATE TABLE Funcionario(
	cd_Funcionario INT NOT NULL IDENTITY(1,1),
	nm_Funcionario VARCHAR(30) NOT NULL,
	cd_GeneroFuncionario INT NOT NULL,
	dt_nascimentoFuncionario DATE NOT NULL,
	dt_emissaoRGFuncionario DATE NOT NULL,
	cd_OrgaoEmissorRGFuncionario INT NOT NULL,
	nr_RGFuncionario VARCHAR(11) NOT NULL,
	nr_CPFFuncionario BIGINT NOT NULL,
	cd_DepartamentoFuncionario INT NOT NULL,
	CONSTRAINT pk_Funcionario PRIMARY KEY(cd_Funcionario),
	CONSTRAINT fk_Genero FOREIGN KEY(cd_GeneroFuncionario) REFERENCES Genero(cd_Genero),
	CONSTRAINT fk_OrgaoEmissorRG FOREIGN KEY(cd_OrgaoEmissorRGFuncionario) REFERENCES OrgaoEmissorRG(cd_OrgaoEmissorRG),
	CONSTRAINT fk_Departamento FOREIGN KEY(cd_DepartamentoFuncionario) REFERENCES Departamento(cd_Departamento)
)

ALTER TABLE Departamento
ADD CONSTRAINT fk_FuncionarioGerente FOREIGN KEY(cd_FuncionarioGerente) REFERENCES Funcionario(cd_Funcionario)

-- INSERÇÕES NAS TABELAS ---------------------------------------

INSERT INTO Genero (ds_Genero,abr_Genero)
VALUES
('Masculino','M'),
('Feminino', 'F')

INSERT INTO OrgaoEmissorRG (ds_OrgaoEmissorRG,abr_OrgaoEmissorRG)
VALUES
('Secretaria de Segurança Pública','SSP'),
('Polícia Federal','PF')

INSERT INTO Departamento (nm_Departamento,abr_Departamento,cd_FuncionarioGerente)
VALUES
('Recursos Humanos','RH',NULL),
('Tecnologia','TEC',NULL)

INSERT INTO Funcionario (nm_Funcionario,cd_GeneroFuncionario,dt_nascimentoFuncionario,dt_emissaoRGFuncionario,cd_OrgaoEmissorRGFuncionario,nr_RGFuncionario,nr_CPFFuncionario,cd_DepartamentoFuncionario)
VALUES 
('Carlos Silva', 1, '1990-01-15', '2010-02-20', 1, '12345678901', 12345678901, 1),
('Ana Souza', 2, '1988-05-10', '2009-03-15', 2, '23456789012', 23456789012, 2);

-- ALTERAÇÃO E INSERÇÃO DOS GERENTES

UPDATE Departamento              -- ATUALIZA a tabela Departamento
SET cd_FuncionarioGerente = 1    -- SETANDO o campo cd_FuncionarioGerente == 1 (Carlos) 
WHERE cd_Departamento = 1        -- ONDE o cd_Departamento seja igual a 1 (Recursos Humanos)

UPDATE Departamento
SET cd_FuncionarioGerente = 2
WHERE cd_Departamento = 2

SELECT * FROM Funcionario
SELECT * FROM Departamento
SELECT * FROM Genero
SELECT * FROM OrgaoEmissorRG

-- Problema 7 Lista 1 ---------------------------------------------------

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
