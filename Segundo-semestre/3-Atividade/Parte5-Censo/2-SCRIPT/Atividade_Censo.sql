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
('Universidade de São Paulo (USP)', 'Pública Estadual', 'Universidade', 'São Paulo', 'SP'),
('Universidade Paulista (UNIP)', 'Privada', 'Universidade', 'São Paulo', 'SP'),
('Centro Universitário FMU', 'Privada', 'Centro Universitário', 'São Paulo', 'SP'),
('Universidade Presbiteriana Mackenzie', 'Privada', 'Universidade', 'São Paulo', 'SP'),
('Pontifícia Universidade Católica de São Paulo (PUC-SP)', 'Privada', 'Universidade', 'São Paulo', 'SP'),
('FATEC São Paulo', 'Pública Estadual', 'Faculdade de Tecnologia', 'São Paulo', 'SP'),
('FATEC Zona Leste', 'Pública Estadual', 'Faculdade de Tecnologia', 'São Paulo', 'SP'),
('Centro Universitário SENAC São Paulo', 'Privada', 'Centro Universitário', 'São Paulo', 'SP'),
('Universidade São Judas Tadeu', 'Privada', 'Universidade', 'São Paulo', 'SP'),
('Anhanguera São Paulo', 'Privada', 'Universidade', 'São Paulo', 'SP');

-- Cursos

-- USP
INSERT INTO Curso (id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
(1, 'Ciência da Computação', 'Bacharelado', 'Presencial', 60, 'Tecnologia'),
(1, 'Engenharia de Computação', 'Bacharelado', 'Presencial', 40, 'Engenharias'),
(1, 'Sistemas de Informação', 'Bacharelado', 'Presencial', 50, 'Tecnologia');

-- UNIP
INSERT INTO Curso (id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
(2, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 80, 'Tecnologia'),
(2, 'Gestão da Tecnologia da Informação', 'Tecnólogo', 'Presencial', 60, 'Tecnologia'),
(2, 'Ciência da Computação', 'Bacharelado', 'Presencial', 70, 'Tecnologia');

-- FMU
INSERT INTO Curso (id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
(3, 'Sistemas de Informação', 'Bacharelado', 'Presencial', 60, 'Tecnologia'),
(3, 'Design Digital', 'Bacharelado', 'Presencial', 50, 'Artes e Design'),
(3, 'Engenharia de Software', 'Bacharelado', 'Presencial', 40, 'Tecnologia');

-- Mackenzie
INSERT INTO Curso (id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
(4, 'Engenharia de Software', 'Bacharelado', 'Presencial', 50, 'Tecnologia'),
(4, 'Ciência da Computação', 'Bacharelado', 'Presencial', 40, 'Tecnologia'),
(4, 'Sistemas de Informação', 'Bacharelado', 'Presencial', 60, 'Tecnologia');

-- PUC-SP
INSERT INTO Curso (id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
(5, 'Ciências da Computação', 'Bacharelado', 'Presencial', 40, 'Tecnologia'),
(5, 'Jogos Digitais', 'Tecnólogo', 'Presencial', 50, 'Tecnologia'),
(5, 'Engenharia da Computação', 'Bacharelado', 'Presencial', 35, 'Tecnologia');

-- FATEC São Paulo
INSERT INTO Curso (id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
(6, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 80, 'Tecnologia'),
(6, 'Banco de Dados', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(6, 'Gestão da Tecnologia da Informação', 'Tecnólogo', 'Presencial', 40, 'Tecnologia');

-- FATEC Zona Leste
INSERT INTO Curso (id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
(7, 'Desenvolvimento de Software Multiplataforma', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(7, 'Sistemas para Internet', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(7, 'Big Data para Negócios', 'Tecnólogo', 'Presencial', 40, 'Tecnologia');

-- SENAC SP
INSERT INTO Curso (id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
(8, 'Sistemas de Informação', 'Bacharelado', 'Presencial', 50, 'Tecnologia'),
(8, 'Jogos Digitais', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(8, 'Ciência da Computação', 'Bacharelado', 'Presencial', 40, 'Tecnologia');

-- São Judas
INSERT INTO Curso (id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
(9, 'Engenharia de Software', 'Bacharelado', 'Presencial', 40, 'Tecnologia'),
(9, 'Sistemas de Informação', 'Bacharelado', 'Presencial', 60, 'Tecnologia'),
(9, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 70, 'Tecnologia');

-- Anhanguera
INSERT INTO Curso (id_InstituicaoEnsino, nome_Curso, grau_Academico, modalidade, numero_Vagas, area) VALUES
(10, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 100, 'Tecnologia'),
(10, 'Engenharia de Computação', 'Bacharelado', 'Presencial', 50, 'Tecnologia'),
(10, 'Ciência da Computação', 'Bacharelado', 'Presencial', 60, 'Tecnologia');

-- Alunos
INSERT INTO Aluno (id_Curso, ano_Ingresso, sexo, cor_Raca, idade, situacao) VALUES
-- USP
(1, 2022, 'Masculino', 'Branco', 20, 'Cursando'),
(2, 2021, 'Feminino', 'Parda', 22, 'Cursando'),

-- UNIP
(4, 2023, 'Masculino', 'Negro', 19, 'Cursando'),
(5, 2022, 'Feminino', 'Branca', 25, 'Trancado'),
(6, 2021, 'Feminino', 'Parda', 30, 'Cursando'),

-- FMU
(7, 2022, 'Masculino', 'Branco', 27, 'Cursando'),
(8, 2023, 'Feminino', 'Negra', 18, 'Cursando'),
(9, 2020, 'Masculino', 'Pardo', 31, 'Formado'),

-- Mackenzie
(10, 2023, 'Feminino', 'Branca', 19, 'Cursando'),
(11, 2021, 'Masculino', 'Negro', 24, 'Cursando'),
(12, 2020, 'Masculino', 'Branco', 29, 'Desvinculado'),

-- PUC-SP
(13, 2022, 'Feminino', 'Branca', 26, 'Cursando'),
(14, 2023, 'Masculino', 'Negro', 20, 'Cursando'),
(15, 2021, 'Feminino', 'Parda', 28, 'Trancado'),

-- FATEC São Paulo
(16, 2023, 'Masculino', 'Branco', 21, 'Cursando'),
(17, 2022, 'Feminino', 'Negra', 23, 'Cursando'),

-- FATEC Zona Leste
(19, 2021, 'Masculino', 'Pardo', 35, 'Cursando'),

-- SENAC SP
(22, 2023, 'Feminino', 'Negra', 19, 'Cursando'),

-- São Judas
(25, 2022, 'Masculino', 'Branco', 32, 'Cursando'),

-- Anhanguera
(28, 2021, 'Feminino', 'Parda', 34, 'Cursando');


-- Consultas
-- 1. Listar todas as escolas publicas
SELECT *
FROM instituicaoEnsino
WHERE categoria_Administrativa LIKE '%Pública%'

--2. Alunos com idade entre 25 e 30 anos
SELECT *
FROM Aluno
WHERE idade BETWEEN 25 AND 30

--3. Cursos com o nome da instituição
SELECT 
	c.nome_Curso AS 'Nome Curso',
	c.modalidade AS 'Modalidade',
	i.nome_InstituicaoEnsino AS 'Nome Instituição'
FROM Curso c
	JOIN instituicaoEnsino i
		ON c.id_InstituicaoEnsino = i.id_InstituicaoEnsino

--4. Quantidade de cursos por instituição
SELECT 
	i.nome_InstituicaoEnsino AS 'Nome Instituição',
	COUNT(c.id_Curso) AS 'Total Cursos'
FROM instituicaoEnsino i
	LEFT JOIN Curso c
		ON i.id_InstituicaoEnsino = c.id_InstituicaoEnsino
GROUP BY i.nome_InstituicaoEnsino

--5. Total de alunos por instituição (having > 2)
SELECT 
	i.nome_InstituicaoEnsino AS 'Nome Instituição',
	COUNT(a.id_Aluno) AS 'Total Alunos'
FROM instituicaoEnsino i
	LEFT JOIN Curso c 
		ON i.id_InstituicaoEnsino = c.id_InstituicaoEnsino
	LEFT JOIN Aluno a
		ON a.id_Curso = c.id_Curso
GROUP BY i.nome_InstituicaoEnsino
HAVING COUNT(a.id_Aluno) > 2

--6. Cursos acima da média de vagas
SELECT 
	nome_Curso, numero_Vagas
FROM Curso
WHERE numero_Vagas > (
	SELECT AVG(numero_Vagas)
		FROM Curso
)

--7. Comparar cursos de tecnologia entre instituições
SELECT i.nome_InstituicaoEnsino,
	COUNT(c.id_Curso) AS 'Cursos Tecnologia'
FROM instituicaoEnsino i
	JOIN Curso c
		ON i.id_InstituicaoEnsino = c.id_InstituicaoEnsino
WHERE c.area LIKE 'Tec%'
GROUP BY i.nome_InstituicaoEnsino

--8. View de alunos com curso + instituição
CREATE VIEW v_ALunoCurso AS
	SELECT 
		a.id_Aluno, a.sexo, a.idade, a.situacao,
		c.nome_Curso, c.modalidade, c.area,
		i.nome_InstituicaoEnsino, i.categoria_Administrativa
	FROM Aluno a
	JOIN Curso c
		ON a.id_Curso = c.id_Curso
	JOIN instituicaoEnsino i
		ON i.id_InstituicaoEnsino = c.id_InstituicaoEnsino

SELECT * 
	FROM v_ALunoCurso
WHERE situacao = 'Desvinculado' 

--9. Função para caluclar idade media por curso
CREATE FUNCTION f_calularIdadeCurso(@idCurso INT)
	RETURNS DECIMAL(5,2)
	AS
	BEGIN
		DECLARE @media DECIMAL(5,2)
		SELECT @media = AVG(idade)
			FROM Aluno
		WHERE id_Curso = @idCurso
	RETURN @media
END

SELECT dbo.f_calularIdadeCurso(1) AS 'Idade Média'