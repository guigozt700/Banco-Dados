CREATE DATABASE Desafio2Lista1

USE Desafio2Lista1

-- TABELA OrgaoEmissorRG -------------------------------

CREATE TABLE OrgaoEmissorRG(
	cd_OrgaoEmissorRG INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_OrgaoEmissorRG PRIMARY KEY(cd_OrgaoEmissorRG),
	ds_OrgaoEmissorRG VARCHAR(50) NOT NULL,
	abr_OrgaoEmissorRG VARCHAR(20) NOT NULL
);

-- TABELA Genero -------------------------------

CREATE TABLE Genero(
	cd_Genero INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_Genero PRIMARY KEY(cd_Genero),
	ds_Genero VARCHAR(20) NOT NULL,
	abr_Genero VARCHAR(5) NOT NULL
);

-- TABELA Pais -------------------------------

CREATE TABLE Pais(
	cd_Pais INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_Pais PRIMARY KEY (cd_Pais),
	nm_Pais VARCHAR(20) NOT NULL
);

-- TABELA Nacionalidade -------------------------------

CREATE TABLE Nacionalidade(
	cd_Nacionalidade INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_Nacionalidade PRIMARY KEY (cd_Nacionalidade),
	nm_Nacionalidade VARCHAR(20) NOT NULL,
	pais_Nacionalidade INT NOT NULL,
	CONSTRAINT fk_pais FOREIGN KEY(pais_Nacionalidade) REFERENCES Pais(cd_Pais)
);

-- TABELA Pessoa -------------------------------

CREATE TABLE Pessoa(
	cd_Pessoa INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_Pessoa PRIMARY KEY (cd_Pessoa),
	nm_Pessoa VARCHAR(30) NOT NULL,
	dt_nascimentoPessoa DATE NOT NULL,
	nr_CPF_Pessoa VARCHAR(14) NOT NULL,
	genero_Pessoa INT NOT NULL,
	CONSTRAINT fk_genero FOREIGN KEY (genero_Pessoa) REFERENCES Genero(cd_Genero),
	nacionalidade_Pessoa INT NOT NULL,
	CONSTRAINT fk_nacionalidade FOREIGN KEY (nacionalidade_Pessoa) REFERENCES Nacionalidade(cd_Nacionalidade),
	orgaoEmissorRG INT NOT NULL,
	CONSTRAINT fk_orgaoEmissorRG FOREIGN KEY (orgaoEmissorRG) REFERENCES OrgaoEmissorRG(cd_OrgaoEmissorRG),
	dt_emissaoRG_Pessoa DATE NOT NULL,
	nr_RG_Pessoa VARCHAR(15) NOT NULL
);

-- INSERÇÃO DE DADOS NA TABELA OrgaoEmissorRG ---------------

INSERT INTO OrgaoEmissorRG (ds_OrgaoEmissorRG, abr_OrgaoEmissorRG)
VALUES
('Secretaria de Segurança Pública', 'SSP'),
('Departamento de Polícia Federal', 'DPF'),
('Ministério da Defesa', 'MD');

-- INSERÇÃO DE DADOS NA TABELA Genero ---------------

INSERT INTO Genero (ds_Genero, abr_Genero)
VALUES
('Masculino', 'M'),
('Feminino', 'F'),
('Outro', 'O');

-- INSERÇÃO DE DADOS NA TABELA Pais ---------------

INSERT INTO Pais (nm_Pais)
VALUES
('Brasil'),
('Argentina'),
('Portugal');

-- INSERÇÃO DE DADOS NA TABELA Nacionalidade ---------------

INSERT INTO Nacionalidade (nm_Nacionalidade, pais_Nacionalidade)
VALUES
('Brasileira', 1),
('Argentina', 2),
('Portuguesa', 3);

-- INSERÇÃO DE DADOS NA TABELA Pessoa ---------------

INSERT INTO Pessoa (
	nm_Pessoa, dt_nascimentoPessoa, nr_CPF_Pessoa,
	genero_Pessoa, nacionalidade_Pessoa,
	orgaoEmissorRG, dt_emissaoRG_Pessoa, nr_RG_Pessoa
)
VALUES
('João Silva', '1985-03-15', '123.456.789-00', 1, 1, 1, '2003-04-10', '12.345.678-9'),
('Maria Oliveira', '1992-07-22', '987.654.321-00', 2, 1, 2, '2010-01-20', '98.765.432-1'),
('Carlos Gomes', '1979-12-01', '111.222.333-44', 1, 3, 3, '1997-11-05', '33.222.111-0');

SELECT * FROM Pessoa;
SELECT * FROM OrgaoEmissorRG;
SELECT * FROM Nacionalidade;
SELECT * FROM Genero;
SELECT * FROM Pais;
