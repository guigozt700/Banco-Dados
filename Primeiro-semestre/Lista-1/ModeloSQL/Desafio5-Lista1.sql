CREATE DATABASE Desafio5Lista1

USE Desafio5Lista1

CREATE TABLE Genero(
	cd_Genero INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_genero PRIMARY KEY(cd_genero),
	ds_Genero VARCHAR(20) NOT NULL,
	abr_Genero CHAR(1) NOT NULL
)

CREATE TABLE TipoPapel(
	cd_TipoPapel INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_TipoPapel PRIMARY KEY(cd_TipoPapel),
	ds_TipoPapel VARCHAR(50) NOT NULL
)

CREATE TABLE Filme(
	cd_Filme INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_Filme PRIMARY KEY(cd_Filme),
	ds_tituloFilme VARCHAR(20) NOT NULL,
	ds_subTituloFilme VARCHAR(20) NOT NULL,
	vlr_anoLancamentoFilme INT NOT NULL,
	vlr_bilheteiraFilme DECIMAL(6,2) NOT NULL,
	vlr_tempoDuracaoFilme TIME(0) NOT NULL,
	cd_generoFilme INT NOT NULL,
	CONSTRAINT fk_generoFilme FOREIGN KEY(cd_generoFilme) REFERENCES Genero(cd_Genero)
)

CREATE TABLE Personagem(
	cd_Personagem INT NOT NULL IDENTITY(1,1),
	CONSTRAINT pk_Personagem PRIMARY KEY(cd_Personagem),
	nm_Personagem VARCHAR(30) NOT NULL,
	vlr_TempoCenaPersonagem INT NOT NULL,
	dsc_Personagem VARCHAR(50),
	cd_Filme INT NOT NULL,
	CONSTRAINT fk_Filme FOREIGN KEY(cd_Filme) REFERENCES Filme(cd_Filme),
	cd_tipoPapel INT NOT NULL,
	CONSTRAINT fk_tipoPapel FOREIGN KEY(cd_tipoPapel) REFERENCES TipoPapel(cd_tipoPapel)
)

-- INSERÇÃO DE DADOS --------------------------------

INSERT INTO Genero (ds_Genero, abr_Genero) VALUES
('Ação', 'A'),
('Comédia', 'C'),
('Drama', 'D'),
('Ficção', 'F');

INSERT INTO TipoPapel (ds_TipoPapel) VALUES
('Protagonista'),
('Antagonista'),
('Coadjuvante'),
('Figurante');

INSERT INTO Filme (ds_tituloFilme, ds_subTituloFilme, vlr_anoLancamentoFilme,vlr_bilheteiraFilme, vlr_tempoDuracaoFilme, cd_generoFilme) 
VALUES
('Matrix', 'Revolutions', 2003, 427.30, '02:09:00', 4),
('Vingadores', 'Ultimato', 2019, 858.37, '03:01:00', 1),
('O Riso', 'Do Palhaço', 2011, 23.75, '01:35:00', 2);


INSERT INTO Personagem (nm_Personagem, vlr_TempoCenaPersonagem, dsc_Personagem,cd_Filme,cd_tipoPapel)
VALUES
('Neo', 5400, 'Escolhido para salvar a humanidade', 1, 1),       -- 90 minutos
('Agente Smith', 2700, 'Inimigo principal de Neo', 1, 2),         -- 45 minutos
('Tony Stark', 7200, 'Homem de Ferro', 2, 1),                     -- 120 minutos
('Capitão América', 6000, 'Líder dos Vingadores', 2, 3),          -- 100 minutos
('Palhaço Triste', 1800, 'Figura central da comédia dramática', 3, 1); -- 30 minutos

SELECT * FROM Filme
SELECT * FROM Personagem
SELECT * FROM TipoPapel
SELECT * FROM Genero
SELECT * FROM Filme
SELECT * FROM Filme

