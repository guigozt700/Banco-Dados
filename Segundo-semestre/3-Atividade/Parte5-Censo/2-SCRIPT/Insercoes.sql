USE Atividade_Censo

--Inserções

--InstituicaoEnsino
INSERT INTO instituicaoEnsino (nome_InstituicaoEnsino, categoria_Administrativa, organizacaoAcademica, municipio, uf)
VALUES
('Universidade de São Paulo (USP)', 'Pública Estadual', 'Universidade', 'São Paulo', 'SP'),
('Universidade Estadual de Campinas (UNICAMP)', 'Pública Estadual', 'Universidade', 'Campinas', 'SP'),
('Universidade Estadual Paulista (UNESP) - Bauru', 'Pública Estadual', 'Universidade', 'Bauru', 'SP'),
('Universidade Estadual Paulista (UNESP) - Rio Claro', 'Pública Estadual', 'Universidade', 'Rio Claro', 'SP'),
('Universidade Federal do ABC (UFABC)', 'Pública Federal', 'Universidade', 'Santo André / São Bernardo do Campo', 'SP'),
('Universidade Federal de São Paulo (UNIFESP)', 'Pública Federal', 'Universidade', 'São Paulo', 'SP'),
('Instituto Federal de São Paulo (IFSP) - São Paulo', 'Pública Federal', 'Instituto', 'São Paulo', 'SP'),
('Instituto Federal de São Paulo (IFSP) - Diadema', 'Pública Federal', 'Instituto', 'Diadema', 'SP'),
('Universidade Presbiteriana Mackenzie', 'Privada', 'Universidade', 'São Paulo', 'SP'),
('Universidade Anhembi Morumbi', 'Privada', 'Universidade', 'São Paulo', 'SP'),
('Universidade São Judas Tadeu', 'Privada', 'Universidade', 'São Paulo', 'SP'),
('Universidade Metodista de São Paulo', 'Privada', 'Universidade', 'São Bernardo do Campo', 'SP'),
('Universidade Santo Amaro (UNISA)', 'Privada', 'Universidade', 'São Paulo', 'SP'),
('Centro Universitário FMU', 'Privada', 'Centro Universitário', 'São Paulo', 'SP'),
('Centro Universitário SENAC São Paulo', 'Privada', 'Centro Universitário', 'São Paulo', 'SP'),
('Centro Universitário Nove de Julho (Uninove)', 'Privada', 'Centro Universitário', 'São Paulo', 'SP'),
('Centro Universitário Belas Artes de São Paulo', 'Privada', 'Centro Universitário', 'São Paulo', 'SP'),
('Escola de Administração de Empresas da FGV – EAESP', 'Privada', 'Faculdade', 'São Paulo', 'SP'),
('Centro Universitário São Camilo', 'Privada', 'Centro Universitário', 'São Paulo', 'SP'),
('Centro Universitário Ítalo-Brasileiro', 'Privada', 'Centro Universitário', 'São Paulo', 'SP'),
('Centro Universitário Anhanguera de São Paulo', 'Privada', 'Centro Universitário', 'São Paulo', 'SP'),
('FATEC São Paulo', 'Pública Estadual', 'Faculdade de Tecnologia', 'São Paulo', 'SP'),
('FATEC Diadema', 'Pública Estadual', 'Faculdade de Tecnologia', 'Diadema', 'SP'),
('FATEC Zona Leste', 'Pública Estadual', 'Faculdade de Tecnologia', 'São Paulo', 'SP'),
('FATEC Itaquera', 'Pública Estadual', 'Faculdade de Tecnologia', 'São Paulo', 'SP'),
('FATEC São Bernardo do Campo', 'Pública Estadual', 'Faculdade de Tecnologia', 'São Bernardo do Campo', 'SP'),
('FATEC Sorocaba', 'Pública Estadual', 'Faculdade de Tecnologia', 'Sorocaba', 'SP'),
('FATEC Campinas', 'Pública Estadual', 'Faculdade de Tecnologia', 'Campinas', 'SP'),
('FATEC Guarulhos', 'Pública Estadual', 'Faculdade de Tecnologia', 'Guarulhos', 'SP');

-- Cursos

-- Cursos USP (id_InstituicaoEnsino = 1)
INSERT INTO Curso VALUES
(1, 'Engenharia de Computação', 'Bacharelado', 'Presencial', 120, 'Tecnologia'),
(1, 'Medicina', 'Bacharelado', 'Presencial', 100, 'Saúde'),
(1, 'Administração', 'Bacharelado', 'EAD', 80, 'Administração');

-- Cursos UNICAMP (id_InstituicaoEnsino = 2)
INSERT INTO Curso VALUES
(2, 'Ciência da Computação', 'Bacharelado', 'Presencial', 80, 'Tecnologia'),
(2, 'Engenharia Química', 'Bacharelado', 'Semipresencial', 60, 'Engenharia'),
(2, 'Administração', 'Bacharelado', 'EAD', 100, 'Administração');

-- Cursos UNESP Bauru (id_InstituicaoEnsino = 3)
INSERT INTO Curso VALUES
(3, 'Medicina', 'Bacharelado', 'Presencial', 90, 'Saúde'),
(3, 'Engenharia de Produção', 'Bacharelado', 'Semipresencial', 60, 'Engenharia'),
(3, 'Ciências Contábeis', 'Bacharelado', 'EAD', 50, 'Administração');

-- Cursos UNESP Rio Claro (id_InstituicaoEnsino = 4)
INSERT INTO Curso VALUES
(4, 'Engenharia Civil', 'Bacharelado', 'Presencial', 60, 'Engenharia'),
(4, 'Ciência da Computação', 'Bacharelado', 'EAD', 80, 'Tecnologia'),
(4, 'Gestão Ambiental', 'Bacharelado', 'Semipresencial', 50, 'Ambiental');

-- Cursos UFABC (id_InstituicaoEnsino = 5)
INSERT INTO Curso VALUES
(5, 'Engenharia de Computação', 'Bacharelado', 'Presencial', 80, 'Tecnologia'),
(5, 'Engenharia Química', 'Bacharelado', 'Semipresencial', 60, 'Engenharia'),
(5, 'Licenciatura em Física', 'Licenciatura', 'EAD', 40, 'Educação');

-- Cursos UNIFESP (id_InstituicaoEnsino = 6)
INSERT INTO Curso VALUES
(6, 'Medicina', 'Bacharelado', 'Presencial', 120, 'Saúde'),
(6, 'Enfermagem', 'Bacharelado', 'EAD', 100, 'Saúde'),
(6, 'Farmácia', 'Bacharelado', 'Semipresencial', 80, 'Saúde');

-- Cursos IFSP São Paulo (id_InstituicaoEnsino = 7)
INSERT INTO Curso VALUES
(7, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(7, 'Gestão de Negócios', 'Tecnólogo', 'EAD', 40, 'Administração'),
(7, 'Logística', 'Tecnólogo', 'Semipresencial', 40, 'Administração');

-- Cursos IFSP Diadema (id_InstituicaoEnsino = 8)
INSERT INTO Curso VALUES
(8, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(8, 'Gestão Empresarial', 'Tecnólogo', 'EAD', 40, 'Administração'),
(8, 'Meio Ambiente', 'Tecnólogo', 'Semipresencial', 40, 'Ambiental');

-- Cursos Mackenzie (id_InstituicaoEnsino = 9)
INSERT INTO Curso VALUES
(9, 'Direito', 'Bacharelado', 'Presencial', 200, 'Jurídico'),
(9, 'Administração', 'Bacharelado', 'EAD', 120, 'Administração'),
(9, 'Engenharia Civil', 'Bacharelado', 'Semipresencial', 80, 'Engenharia');

-- Cursos Anhembi Morumbi (id_InstituicaoEnsino = 10)
INSERT INTO Curso VALUES
(10, 'Medicina', 'Bacharelado', 'Presencial', 100, 'Saúde'),
(10, 'Administração', 'Bacharelado', 'EAD', 120, 'Administração'),
(10, 'Arquitetura e Urbanismo', 'Bacharelado', 'Semipresencial', 80, 'Arquitetura');

-- Cursos São Judas Tadeu (id_InstituicaoEnsino = 11)
INSERT INTO Curso VALUES
(11, 'Engenharia de Computação', 'Bacharelado', 'Presencial', 60, 'Tecnologia'),
(11, 'Direito', 'Bacharelado', 'EAD', 100, 'Jurídico'),
(11, 'Psicologia', 'Bacharelado', 'Semipresencial', 80, 'Saúde');

-- Cursos Metodista (id_InstituicaoEnsino = 12)
INSERT INTO Curso VALUES
(12, 'Administração', 'Bacharelado', 'Presencial', 100, 'Administração'),
(12, 'Engenharia Civil', 'Bacharelado', 'EAD', 60, 'Engenharia'),
(12, 'Arquitetura e Urbanismo', 'Bacharelado', 'Semipresencial', 80, 'Arquitetura');

-- Cursos UNISA (id_InstituicaoEnsino = 13)
INSERT INTO Curso VALUES
(13, 'Enfermagem', 'Bacharelado', 'Presencial', 100, 'Saúde'),
(13, 'Nutrição', 'Bacharelado', 'EAD', 80, 'Saúde'),
(13, 'Administração', 'Bacharelado', 'Semipresencial', 120, 'Administração');

-- Cursos FMU (id_InstituicaoEnsino = 14)
INSERT INTO Curso VALUES
(14, 'Direito', 'Bacharelado', 'Presencial', 120, 'Jurídico'),
(14, 'Administração', 'Bacharelado', 'EAD', 100, 'Administração'),
(14, 'Engenharia Civil', 'Bacharelado', 'Semipresencial', 60, 'Engenharia');

-- Cursos SENAC (id_InstituicaoEnsino = 15)
INSERT INTO Curso VALUES
(15, 'Gestão Empresarial', 'Bacharelado', 'Presencial', 80, 'Administração'),
(15, 'Design Gráfico', 'Bacharelado', 'EAD', 60, 'Design'),
(15, 'Sistemas de Informação', 'Bacharelado', 'Semipresencial', 60, 'Tecnologia');

-- Cursos Uninove (id_InstituicaoEnsino = 16)
INSERT INTO Curso VALUES
(16, 'Direito', 'Bacharelado', 'Presencial', 120, 'Jurídico'),
(16, 'Engenharia Civil', 'Bacharelado', 'EAD', 80, 'Engenharia'),
(16, 'Administração', 'Bacharelado', 'Semipresencial', 100, 'Administração');

-- Cursos Belas Artes (id_InstituicaoEnsino = 17)
INSERT INTO Curso VALUES
(17, 'Design de Interiores', 'Bacharelado', 'Presencial', 40, 'Design'),
(17, 'Artes Visuais', 'Bacharelado', 'EAD', 60, 'Artes'),
(17, 'Moda', 'Bacharelado', 'Semipresencial', 50, 'Design');

-- Cursos FGV EAESP (id_InstituicaoEnsino = 18)
INSERT INTO Curso VALUES
(18, 'Administração', 'Bacharelado', 'Presencial', 120, 'Administração'),
(18, 'Economia', 'Bacharelado', 'EAD', 80, 'Economia'),
(18, 'Gestão de Negócios', 'Bacharelado', 'Semipresencial', 60, 'Administração');

-- Cursos São Camilo (id_InstituicaoEnsino = 19)
INSERT INTO Curso VALUES
(19, 'Enfermagem', 'Bacharelado', 'Presencial', 100, 'Saúde'),
(19, 'Fisioterapia', 'Bacharelado', 'EAD', 80, 'Saúde'),
(19, 'Psicologia', 'Bacharelado', 'Semipresencial', 60, 'Saúde');

-- Cursos Ítalo-Brasileiro (id_InstituicaoEnsino = 20)
INSERT INTO Curso VALUES
(20, 'Administração', 'Bacharelado', 'Presencial', 100, 'Administração'),
(20, 'Engenharia Civil', 'Bacharelado', 'EAD', 60, 'Engenharia'),
(20, 'Ciência da Computação', 'Bacharelado', 'Semipresencial', 80, 'Tecnologia');

-- Cursos Anhanguera SP (id_InstituicaoEnsino = 21)
INSERT INTO Curso VALUES
(21, 'Administração', 'Bacharelado', 'Presencial', 120, 'Administração'),
(21, 'Engenharia de Produção', 'Bacharelado', 'EAD', 80, 'Engenharia'),
(21, 'Direito', 'Bacharelado', 'Semipresencial', 100, 'Jurídico');

-- Cursos Anhanguera São Paulo (id_InstituicaoEnsino = 22)
INSERT INTO Curso VALUES
(22, 'Administração', 'Bacharelado', 'Presencial', 120, 'Administração'),
(22, 'Engenharia de Produção', 'Bacharelado', 'EAD', 80, 'Engenharia'),
(22, 'Direito', 'Bacharelado', 'Semipresencial', 100, 'Jurídico');

-- Cursos FATEC São Paulo (id_InstituicaoEnsino = 23)
INSERT INTO Curso VALUES
(23, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(23, 'Gestão Empresarial', 'Tecnólogo', 'EAD', 40, 'Administração'),
(23, 'Gestão de Turismo', 'Tecnólogo', 'Semipresencial', 40, 'Turismo');

-- Cursos FATEC Diadema (id_InstituicaoEnsino = 24)
INSERT INTO Curso VALUES
(24, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(24, 'Logística', 'Tecnólogo', 'EAD', 40, 'Administração'),
(24, 'Gestão Empresarial', 'Tecnólogo', 'Semipresencial', 40, 'Administração');

-- Cursos FATEC Zona Leste (id_InstituicaoEnsino = 25)
INSERT INTO Curso VALUES
(25, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(25, 'Gestão Comercial', 'Tecnólogo', 'EAD', 40, 'Administração'),
(25, 'Gestão Empresarial', 'Tecnólogo', 'Semipresencial', 40, 'Administração');

-- Cursos FATEC Itaquera (id_InstituicaoEnsino = 26)
INSERT INTO Curso VALUES
(26, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(26, 'Gestão de Recursos Humanos', 'Tecnólogo', 'EAD', 40, 'Administração'),
(26, 'Gestão Empresarial', 'Tecnólogo', 'Semipresencial', 40, 'Administração');

-- Cursos FATEC São Bernardo do Campo (id_InstituicaoEnsino = 27)
INSERT INTO Curso VALUES
(27, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(27, 'Gestão Comercial', 'Tecnólogo', 'EAD', 40, 'Administração'),
(27, 'Gestão Empresarial', 'Tecnólogo', 'Semipresencial', 40, 'Administração');

-- Cursos FATEC Sorocaba (id_InstituicaoEnsino = 28)
INSERT INTO Curso VALUES
(28, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(28, 'Gestão Comercial', 'Tecnólogo', 'EAD', 40, 'Administração'),
(28, 'Gestão Empresarial', 'Tecnólogo', 'Semipresencial', 40, 'Administração');

-- Cursos FATEC Campinas (id_InstituicaoEnsino = 29)
INSERT INTO Curso VALUES
(29, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(29, 'Gestão Comercial', 'Tecnólogo', 'EAD', 40, 'Administração'),
(29, 'Gestão Empresarial', 'Tecnólogo', 'Semipresencial', 40, 'Administração');

-- Cursos FATEC Guarulhos (id_InstituicaoEnsino = 30)
INSERT INTO Curso VALUES
(30, 'Análise e Desenvolvimento de Sistemas', 'Tecnólogo', 'Presencial', 40, 'Tecnologia'),
(30, 'Gestão Comercial', 'Tecnólogo', 'EAD', 40, 'Administração'),
(30, 'Gestão Empresarial', 'Tecnólogo', 'Semipresencial', 40, 'Administração');

-- Alunos
-- Inserindo 1 aluno por curso
INSERT INTO Aluno (id_Curso, ano_Ingresso, sexo, cor_Raca, idade, situacao) VALUES
-- Curso 1
(1, 2023, 'Masculino', 'Branca', 19, 'Matriculado'),
(1, 2022, 'Feminino', 'Parda', 21, 'Matriculado'),

-- Curso 2
(2, 2023, 'Feminino', 'Preta', 18, 'Matriculado'),
(2, 2021, 'Masculino', 'Indígena', 22, 'Desvinculado'),

-- Curso 3
(3, 2023, 'Masculino', 'Amarela', 20, 'Matriculado'),
(3, 2022, 'Feminino', 'Branca', 23, 'Matriculado'),

-- Curso 4
(4, 2023, 'Feminino', 'Parda', 19, 'Matriculado'),
(4, 2021, 'Masculino', 'Preta', 24, 'Desvinculado'),

-- Curso 5
(5, 2023, 'Masculino', 'Branca', 21, 'Matriculado'),
(5, 2022, 'Feminino', 'Indígena', 22, 'Matriculado'),

-- Curso 6
(6, 2023, 'Feminino', 'Parda', 20, 'Matriculado'),
(6, 2022, 'Masculino', 'Branca', 23, 'Matriculado'),

-- Curso 7
(7, 2023, 'Masculino', 'Preta', 22, 'Matriculado'),
(7, 2021, 'Feminino', 'Amarela', 24, 'Desvinculado'),

-- Curso 8
(8, 2023, 'Feminino', 'Branca', 19, 'Matriculado'),
(8, 2022, 'Masculino', 'Parda', 21, 'Matriculado'),

-- Curso 9
(9, 2023, 'Masculino', 'Branca', 20, 'Matriculado'),
(9, 2021, 'Feminino', 'Preta', 22, 'Desvinculado'),

-- Curso 10
(10, 2023, 'Feminino', 'Indígena', 21, 'Matriculado'),
(10, 2022, 'Masculino', 'Branca', 23, 'Matriculado'),

-- Curso 11
(11, 2023, 'Masculino', 'Parda', 19, 'Matriculado'),
(11, 2022, 'Feminino', 'Amarela', 22, 'Matriculado'),

-- Curso 12
(12, 2023, 'Feminino', 'Branca', 20, 'Matriculado'),
(12, 2021, 'Masculino', 'Preta', 24, 'Desvinculado'),

-- Curso 13
(13, 2023, 'Masculino', 'Branca', 22, 'Matriculado'),
(13, 2022, 'Feminino', 'Parda', 21, 'Matriculado'),

-- Curso 14
(14, 2023, 'Feminino', 'Amarela', 19, 'Matriculado'),
(14, 2021, 'Masculino', 'Indígena', 23, 'Desvinculado'),

-- Curso 15
(15, 2023, 'Masculino', 'Branca', 20, 'Matriculado'),
(15, 2022, 'Feminino', 'Preta', 21, 'Matriculado'),

-- Curso 16
(16, 2023, 'Feminino', 'Parda', 22, 'Matriculado'),
(16, 2022, 'Masculino', 'Branca', 23, 'Matriculado'),

-- Curso 17
(17, 2023, 'Masculino', 'Preta', 19, 'Matriculado'),
(17, 2021, 'Feminino', 'Amarela', 20, 'Desvinculado'),

-- Curso 18
(18, 2023, 'Feminino', 'Branca', 21, 'Matriculado'),
(18, 2022, 'Masculino', 'Parda', 22, 'Matriculado'),

-- Curso 19
(19, 2023, 'Masculino', 'Amarela', 23, 'Matriculado'),
(19, 2022, 'Feminino', 'Branca', 24, 'Matriculado'),

-- Curso 20
(20, 2023, 'Feminino', 'Parda', 19, 'Matriculado'),
(20, 2022, 'Masculino', 'Indígena', 21, 'Matriculado'),

-- Curso 21
(21, 2023, 'Masculino', 'Branca', 22, 'Matriculado'),
(21, 2022, 'Feminino', 'Preta', 23, 'Matriculado'),

-- Curso 22
(22, 2023, 'Feminino', 'Amarela', 20, 'Matriculado'),
(22, 2022, 'Masculino', 'Parda', 21, 'Matriculado'),

-- Curso 23
(23, 2023, 'Masculino', 'Branca', 19, 'Matriculado'),
(23, 2022, 'Feminino', 'Preta', 20, 'Matriculado'),

-- Curso 24
(24, 2023, 'Feminino', 'Parda', 21, 'Matriculado'),
(24, 2022, 'Masculino', 'Branca', 22, 'Matriculado'),

-- Curso 25
(25, 2023, 'Masculino', 'Amarela', 23, 'Matriculado'),
(25, 2022, 'Feminino', 'Parda', 24, 'Matriculado'),

-- Curso 26
(26, 2023, 'Feminino', 'Branca', 19, 'Matriculado'),
(26, 2022, 'Masculino', 'Preta', 20, 'Matriculado'),

-- Curso 27
(27, 2023, 'Masculino', 'Parda', 21, 'Matriculado'),
(27, 2022, 'Feminino', 'Branca', 22, 'Matriculado'),

-- Curso 28
(28, 2023, 'Feminino', 'Amarela', 23, 'Matriculado'),
(28, 2022, 'Masculino', 'Branca', 24, 'Matriculado'),

-- Curso 29
(29, 2023, 'Masculino', 'Parda', 20, 'Matriculado'),
(29, 2022, 'Feminino', 'Preta', 21, 'Matriculado'),

-- Curso 30
(30, 2023, 'Feminino', 'Branca', 22, 'Matriculado'),
(30, 2022, 'Masculino', 'Parda', 23, 'Matriculado');
