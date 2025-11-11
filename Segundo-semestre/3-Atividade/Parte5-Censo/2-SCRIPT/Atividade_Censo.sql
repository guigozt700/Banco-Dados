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

--Inserções

--InstituicaoEnsino
INSERT INTO instituicaoEnsino
(nome_InstituicaoEnsino, categoria_Administrativa, organizacaoAcademica, municipio, uf) VALUES
('Universidade Federal de São Paulo', 'Pública Federal', 'Universidade', 'São Paulo', 'SP'),
('Fatec Diadema - Luigi Papaiz', 'Pública Estadual', 'Faculdade de Tecnologia', 'Diadema', 'SP'),
('Universidade Federal de Sao Paulo', 'Publica', 'Universidade', 'Sao Paulo', 'SP'),
('Universidade Estadual de Campinas', 'Publica', 'Universidade', 'Campinas', 'SP'),
('Faculdade Privada de Tecnologia XYZ', 'Privada', 'Faculdade', 'Sao Paulo', 'SP'),
('Universidade Federal do Rio de Janeiro', 'Publica', 'Universidade', 'Rio de Janeiro', 'RJ'),
('Instituto Superior Privado RJ', 'Privada', 'Faculdade', 'Niteroi', 'RJ'),
('Universidade Federal de Minas Gerais', 'Publica', 'Universidade', 'Belo Horizonte', 'MG'),
('Centro Universitario do Espirito Santo', 'Privada', 'Centro', 'Vitoria', 'ES');

-- Cursos
INSERT INTO Curso
(id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
---- 1. Universidade Federal de São Paulo
(1, 'Ciência da Computação', 'Bacharelado', 'Presencial', 100, 'Tecnologia da Informação'),
(1, 'Engenharia Biomédica', 'Bacharelado', 'Presencial', 60, 'Engenharia'),

-- 2. Fatec Diadema - Luigi Papaiz
(2, 'Desenvolvimento de Software Multiplataforma', 'Técnologo', 'Presencial', 80, 'Tecnologia da Informação'),
(2, 'Gestão de Produção Industral', 'Técnologo', 'Presencial', 60, 'Gestão'),
(2, 'Cosméticos', 'Técnologo', 'Semi Presencial', 100, 'Cosmtologia'),

-- 3. Universidade Federal de São Paulo (duplicada - mantida para exemplo)
(3, 'Medicina', 'Bacharelado', 'Presencial', 50, 'Saúde'),

-- 4. Universidade Estadual de Campinas
(4, 'Engenharia de Software', 'Bacharelado', 'Presencial', 120, 'Tecnologia da Informação'),
(4, 'Matemática Aplicada', 'Licenciatura', 'Presencial', 90, 'Ciências Exatas'),

-- 5. Faculdade Privada de Tecnologia XYZ
(5, 'Sistemas para Internet', 'Tecnólogo', 'EAD', 150, 'Tecnologia da Informação'),
(5, 'Gestão da Informação', 'Tecnólogo', 'EAD', 120, 'Gestão'),

-- 6. Universidade Federal do Rio de Janeiro
(6, 'Engenharia de Computação', 'Bacharelado', 'Presencial', 100, 'Engenharia'),

-- 7. Instituto Superior Privado RJ
(7, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'EAD', 120, 'Tecnologia da Informação'),

-- 8. Universidade Federal de Minas Gerais
(8, 'Ciência da Computação', 'Bacharelado', 'Presencial', 100, 'Tecnologia da Informação'),
(8, 'Administração', 'Bacharelado', 'Presencial', 80, 'Gestão'),

-- 9. Centro Universitário do Espírito Santo
(9, 'Sistemas de Informação', 'Bacharelado', 'EAD', 100, 'Tecnologia da Informação'),
(9, 'Engenharia de Produção', 'Bacharelado', 'Presencial', 70, 'Engenharia');

-- Alunos
INSERT INTO Aluno
(id_Curso, ano_Ingresso, sexo, cor_Raca, idade, situacao) VALUES

-- 1. Universidade Federal de São Paulo (id_Instituicao = 1)
(1, 2023, 'Masculino', 'Pardo', 21, 'Cursando'),
(2, 2022, 'Feminino', 'Branca', 24, 'Concluído'),
(1, 2015, 'Feminino', 'Negra', 38, 'Cursando'); 

-- 2. Fatec Diadema - Luigi Papaiz (id_Instituicao = 2)
INSERT INTO Aluno (id_Curso, ano_Ingresso, sexo, cor_Raca, idade, situacao)
VALUES
(3, 2023, 'Masculino', 'Pardo', 21, 'Cursando'),
(3, 2022, 'Feminino', 'Branca', 24, 'Concluído'),
(4, 2018, 'Masculino', 'Negro', 33, 'Cursando'),
(5, 2020, 'Feminino', 'Parda', 35, 'Cursando');

-- 3. UNICAMP (id_Instituicao = 4)
INSERT INTO Aluno (id_Curso, ano_Ingresso, sexo, cor_Raca, idade, situacao)
VALUES
(7, 2022, 'Masculino', 'Branca', 23, 'Trancado'),
(8, 2023, 'Feminino', 'Amarela', 21, 'Cursando'),
(8, 2017, 'Masculino', 'Pardo', 36, 'Cursando');

-- 4. Faculdade Privada XYZ (id_Instituicao = 5)
INSERT INTO Aluno (id_Curso, ano_Ingresso, sexo, cor_Raca, idade, situacao)
VALUES
(9, 2023, 'Feminino', 'Branca', 25, 'Cursando'),
(10, 2024, 'Masculino', 'Pardo', 19, 'Cursando'),
(9, 2015, 'Feminino', 'Negra', 40, 'Cursando');

-- 5. Universidade Federal do Rio de Janeiro (id_Instituicao = 6)
INSERT INTO Aluno (id_Curso, ano_Ingresso, sexo, cor_Raca, idade, situacao)
VALUES
(11, 2022, 'Masculino', 'Branca', 23, 'Cursando'),
(11, 2016, 'Feminino', 'Parda', 38, 'Cursando');

-- 6. Instituto Privado RJ (id_Instituicao = 7)
INSERT INTO Aluno (id_Curso, ano_Ingresso, sexo, cor_Raca, idade, situacao)
VALUES
(12, 2024, 'Feminino', 'Parda', 20, 'Cursando'),
(12, 2013, 'Masculino', 'Negro', 42, 'Cursando');

-- 7. Universidade Federal de Minas Gerais (id_Instituicao = 8)
INSERT INTO Aluno (id_Curso, ano_Ingresso, sexo, cor_Raca, idade, situacao)
VALUES
(13, 2021, 'Masculino', 'Negro', 24, 'Concluído'),
(14, 2023, 'Feminino', 'Branca', 21, 'Cursando'),
(13, 2010, 'Feminino', 'Parda', 39, 'Cursando');

-- 8. Centro Universitário do Espírito Santo (id_Instituicao = 9)
INSERT INTO Aluno (id_Curso, ano_Ingresso, sexo, cor_Raca, idade, situacao)
VALUES
(15, 2024, 'Masculino', 'Branca', 20, 'Cursando'),
(16, 2023, 'Feminino', 'Parda', 22, 'Cursando'),
(16, 2012, 'Masculino', 'Negro', 41, 'Cursando');

-- Consultas

-- 1. Cursos e suas respectivas instituições
SELECT
	c.nome_Curso AS 'Nome Curso', 
	i.nome_InstituicaoEnsino AS 'Nome Instiuição de Ensino',
	i.uf AS 'UF',
	c.modalidade AS 'Modalidade ensino'
FROM Curso c
	JOIN instituicaoEnsino i
		on c.id_InstituicaoEnsino = i.id_InstituicaoEnsino

-- 2. Total de alunos por curso