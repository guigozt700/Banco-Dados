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
