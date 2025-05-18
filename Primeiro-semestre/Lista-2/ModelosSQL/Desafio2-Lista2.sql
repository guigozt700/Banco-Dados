CREATE DATABASE Desafio2Lista2

USE Desafio2Lista2

CREATE TABLE GeneroPessoa(
	cd_GeneroPessoa INT IDENTITY(1,1),
	ds_GeneroPessoa VARCHAR(20) NOT NULL,
	abr_GeneroPessoa CHAR(1) NOT NULL,
	CONSTRAINT pk_GeneroPessoa PRIMARY KEY(cd_GeneroPessoa)
)

CREATE TABLE Artista(
	cd_Artista INT IDENTITY(1,1),
	nm_Artista VARCHAR(30) NOT NULL,
	dt_nascimentoArtista DATE NOT NULL,
	cd_GeneroPessoaArtista INT NOT NULL,
	CONSTRAINT pk_Artista PRIMARY KEY(cd_Artista),
	CONSTRAINT fk_Genero FOREIGN KEY (cd_GeneroPessoaArtista) REFERENCES GeneroPessoa(cd_GeneroPessoa)
)

CREATE TABLE Musica(
	cd_Musica INT IDENTITY(1,1),
	vlr_tempoDuracaoMusica TIME NOT NULL,
	dt_anolancamentoMusica INT NOT NULL,
	CONSTRAINT pk_Musica PRIMARY KEY(cd_Musica)
)

CREATE TABLE Composicao(
	cd_Musica INT NOT NULL,
	cd_Artista INT NOT NULL,
	is_CompositorMelodia BIT NOT NULL,
	is_CompositorLetra BIT NOT NULL,
	CONSTRAINT pk_Composicao PRIMARY KEY(cd_Musica, cd_Artista),
	CONSTRAINT fk_Musica FOREIGN KEY(cd_Musica) REFERENCES Musica(cd_Musica),
	CONSTRAINT fk_Artista FOREIGN KEY(cd_Artista) REFERENCES Artista(cd_Artista)
)

-- INSERÇÕES NAS TABELAS --------------------------

INSERT INTO GeneroPessoa (ds_GeneroPessoa, abr_GeneroPessoa) 
VALUES
('Masculino', 'M'),
('Feminino', 'F'),
('Não Binário', 'N');

INSERT INTO Artista (nm_Artista, dt_nascimentoArtista, cd_GeneroPessoaArtista) 
VALUES
('João Silva', '1990-05-15', 1),
('Maria Oliveira', '1985-09-20', 2),
('Alex Rocha', '1995-12-01', 3);

INSERT INTO Musica (vlr_tempoDuracaoMusica, dt_anolancamentoMusica) 
VALUES
('00:03:45', 2020),
('00:04:20', 2021),
('00:02:55', 2023);

-- Música 1: João fez a melodia, Maria a letra
INSERT INTO Composicao (cd_Musica, cd_Artista, is_CompositorMelodia, is_CompositorLetra) VALUES
(1, 1, 1, 0),
(1, 2, 0, 1);

-- Música 2: Alex fez tudo
INSERT INTO Composicao (cd_Musica, cd_Artista, is_CompositorMelodia, is_CompositorLetra) VALUES
(2, 3, 1, 1);

-- Música 3: João e Alex fizeram juntos
INSERT INTO Composicao (cd_Musica, cd_Artista, is_CompositorMelodia, is_CompositorLetra) VALUES
(3, 1, 1, 0),
(3, 3, 0, 1);

SELECT * FROM Artista
SELECT * FROM Musica
SELECT * FROM Composicao
SELECT * FROM GeneroPessoa

use master

drop database Desafio2Lista2