/*Nome dos integrantes:
	- Hugo Oliveira
	- Guilherme Gomes
	- Paulo Roberto
	- Gabriel Gutierres
	- Caroline Mendes
	- Priscila Mendes */

CREATE DATABASE Atividade_Censo
USE Atividade_Censo

-- Criação das Tabelas
CREATE TABLE instituicaoEnsino(
	id_InstituicaoEnsino INT IDENTITY(1,1) PRIMARY KEY,
	nome_InstituicaoEnsino NVARCHAR(150) NOT NULL,
	categoria_Administrativa NVARCHAR(100) NOT NULL,
	organizacaoAcademica NVARCHAR(100) NOT NULL,
	municipio NVARCHAR(100) NOT NULL,
	uf CHAR(2)
);

CREATE TABLE Curso(
	id_Curso INT IDENTITY(1,1) PRIMARY KEY,
	id_InstituicaoEnsino INT NOT NULL,
	nome_Curso NVARCHAR(100) NOT NULL,
	grau_Academico NVARCHAR(100) NOT NULL,
	modalidade NVARCHAR(50) NOT NULL,
	numero_Vagas INT,
	area NVARCHAR(100),
	CONSTRAINT FK_Curso_Instituicao
		FOREIGN KEY (id_InstituicaoEnsino)
		REFERENCES instituicaoEnsino (id_InstituicaoEnsino)
			ON DELETE CASCADE
			ON UPDATE CASCADE
);

CREATE TABLE Aluno(
	id_Aluno INT IDENTITY(1,1) PRIMARY KEY,
	id_Curso INT NOT NULL,
	ano_Ingresso INT NOT NULL,
	sexo NVARCHAR(30),
	cor_Raca NVARCHAR(50),
	idade INT NOT NULL,
	situacao NVARCHAR(50),
	CONSTRAINT FK_Aluno_Curso
		FOREIGN KEY (id_Curso)
		REFERENCES Curso (id_Curso)
			ON DELETE CASCADE
			ON UPDATE CASCADE
);