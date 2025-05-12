-- Guilherme Gomes da Silva
-- Gabriel da Silva Gutierres

-- DEFAFIO 1 - LISTA 1 ------------------------------------------------------

CREATE DATABASE Desafio1Lista1

USE Desafio1Lista1

-- TABELA UNIDADEMEDIDA ----------------------------------------

CREATE TABLE UnidadeMedida(
	cd_UnidadeMedida INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_UnidadeMedida PRIMARY KEY(cd_UnidadeMedida), 
	nm_UnidadeMedida VARCHAR(20),
	abr_UnidadeMedida VARCHAR(20)
);

-- TABELA UF -----------------------------------------------------

CREATE TABLE UF(
	cd_uf INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_uf PRIMARY KEY (cd_uf),
	nm_uf VARCHAR(20) NOT NULL,
	abr_uf VARCHAR(5) NOT NULL
);

-- TABELA GENERO ---------------------------------------------------

CREATE TABLE Genero(
	cd_Genero INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_Genero PRIMARY KEY (cd_Genero),
	ds_Genero VARCHAR(20) NOT NULL,
	abr_Genero VARCHAR(10)NOT NULL
);

-- TABELA PRODUTO ---------------------------------------------------

CREATE TABLE Produto(
	cd_Produto INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_Produto PRIMARY KEY(cd_Produto),
	ds_Produto VARCHAR(20) NOT NULL,
	nm_Produto VARCHAR(20) NOT NULL,
	vlr_precoCustoProduto DECIMAL(5,2) NOT NULL,
	vlr_pesoProduto DECIMAL(5,2) NOT NULL,
	vlr_volumeProduto DECIMAL(5,2) NOT NULL,
	peso_UnidadeMedidaProduto INT NOT NULL,
	CONSTRAINT fk_peso_UnidadeMedida FOREIGN KEY (peso_UnidadeMedidaProduto) REFERENCES UnidadeMedida(cd_UnidadeMedida),
	volume_UnidadeMedidaProduto INT NOT NULL,
	CONSTRAINT fk_volume_UnidadeMeida FOREIGN KEY (volume_UnidadeMedidaProduto) REFERENCES UnidadeMedida(cd_UnidadeMedida)
);

-- TABELA ENGENHEIRO ------------------------------------------------------------

CREATE TABLE Engenherio(
	cd_Engenheiro INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_Engenheiro PRIMARY KEY(cd_Engenheiro),
	nm_Engenheiro VARCHAR(30) not null,
	dt_nascimentoEngenheiro DATE not null,
	nr_CPFEngenheiro BIGINT NOT NULL,
	nr_CREAEngenheiro INT NOT NULL,
	dt_CREAEngenheiro DATE NOT NULL,
	genero_Engenheiro INT NOT NULL,
	CONSTRAINT fk_generoEngenheiro FOREIGN KEY (genero_Engenheiro) REFERENCES Genero(cd_Genero),
	uf_CREAEngenheiro INT NOT NULL,
	CONSTRAINT fk_ufCREA FOREIGN KEY (uf_CREAEngenheiro) REFERENCES UF(cd_uf)
);

-- INSERÇÕES DE DADOS NA TABELA UnidadeMedida -------------------

INSERT INTO UnidadeMedida (nm_UnidadeMedida, abr_UnidadeMedida) 
VALUES 
('Quilograma', 'KG'),
('Litro', 'L'),
('Metro', 'M');

-- INSERÇÃO DE DADOS NA TABELA UF ------------------

INSERT INTO UF(nm_uf, abr_uf)
VALUES
('São Paulo','SP'),
('Rio de Janeiro','RJ'),
('Minas Gerais','MG');

-- INSERÇÃO DE DADOS NA TABELA Genero ------------

INSERT INTO Genero(ds_Genero,abr_Genero)
VALUES
('Masculino','M'),
('Feminino','F'),
('Outro','O');

-- INSERÇÃO DE DADOS NA TABELA Produto ------------------

INSERT INTO Produto(ds_Produto,nm_Produto,vlr_precoCustoProduto,vlr_pesoProduto,vlr_volumeProduto,peso_UnidadeMedidaProduto,volume_UnidadeMedidaProduto)
VALUES
('Cimento CP-II', 'Cimento Votoran', 25.50, 50.00, 0.00, 1, 2),
('Água Mineral', 'Água Crystal', 2.50, 1.00, 1.00, 1, 2),
('Cabo Elétrico', 'Cabo 2,5mm', 10.00, 2.00, 0.20, 1, 2);

-- INSERÇÃO DE DADOS NA TABELA Engenheiro ---------------------

INSERT INTO Engenherio(nm_Engenheiro,dt_nascimentoEngenheiro,nr_CPFEngenheiro,nr_CREAEngenheiro,dt_CREAEngenheiro,genero_Engenheiro,uf_CREAEngenheiro)
VALUES
('Joao Silva','1985-06-12',12345678901,123456789,'2010-05-10',1,1),
('Maria Silva','1990-08-23', 23456789012, 987654321, '2015-03-15', 2, 2);

SELECT * FROM Produto;
SELECT * FROM Engenherio;
SELECT * FROM UF;
SELECT * FROM UnidadeMedida;
SELECT * FROM Genero;

-- DEFAFIO 2 - LISTA 1 ------------------------------------------------------

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

