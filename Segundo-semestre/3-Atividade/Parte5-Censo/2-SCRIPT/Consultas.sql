--Tema 1: Comparar quantidade, distribuição e perfil de vagas em cursos de Tecnologia (públicos vs privados)

--1.1 View para cursos de Tecnologia com dados da IES
CREATE VIEW vw_CursosTecnologia AS
SELECT 
    c.nome_Curso,
    c.grau_Academico,
    c.modalidade,
    c.numero_Vagas,
    i.nome_InstituicaoEnsino,
    i.categoria_Administrativa,
    i.municipio,
    i.uf
FROM Curso c
JOIN instituicaoEnsino i
    ON c.id_InstituicaoEnsino = i.id_InstituicaoEnsino
WHERE c.area = 'Tecnologia';

select * from vw_CursosTecnologia

--1.2 Total de vagas em cursos de tecnologia por categoria administrativa
SELECT 
    categoria_Administrativa,
    SUM(numero_Vagas) AS total_vagas,
    COUNT(nome_Curso) AS total_cursos
FROM vw_CursosTecnologia
GROUP BY categoria_Administrativa;

--2. Perfil do estudante de cursos EAD vs Presencial

--2.1 View de alunos com informações do curso e modalidade:
CREATE VIEW vw_AlunoCurso AS
SELECT 
    a.id_Aluno,
    a.ano_Ingresso,
    a.sexo,
    a.cor_Raca,
    a.idade,
    a.situacao,
    c.nome_Curso,
    c.modalidade
FROM Aluno a
JOIN Curso c
    ON a.id_Curso = c.id_Curso;

select * from vw_AlunoCurso

--2.2 Função para calcular idade média por modalidade:
CREATE FUNCTION fn_IdadeMediaPorModalidade(@modalidade NVARCHAR(50))
RETURNS FLOAT
AS
BEGIN
    DECLARE @idadeMedia FLOAT;

    SELECT @idadeMedia = AVG(idade * 1.0)
    FROM vw_AlunoCurso
    WHERE modalidade = @modalidade;

    RETURN @idadeMedia;
END;

-- Uso:
SELECT 
    'Presencial' AS modalidade, dbo.fn_IdadeMediaPorModalidade('Presencial') AS idade_media
UNION
SELECT
    'EAD', dbo.fn_IdadeMediaPorModalidade('EAD');

--Tema 3: Evasão nos cursos

--3.1 Consulta: taxa de evasão (Desvinculado / total alunos) por grau acadêmico:
SELECT 
    c.grau_Academico,
    COUNT(CASE WHEN a.situacao = 'Desvinculado' THEN 1 END) * 1.0 / COUNT(a.id_Aluno) AS taxa_evasao
FROM Aluno a
JOIN Curso c
    ON a.id_Curso = c.id_Curso
GROUP BY c.grau_Academico;

--Tema 4: Distribuição regional das IES e vagas (capitais vs interior)

--4.1 View de IES com cursos e vagas:
CREATE VIEW vw_IESVagas AS
SELECT 
    i.nome_InstituicaoEnsino,
    i.municipio,
    i.uf,
    c.nome_Curso,
    c.numero_Vagas
FROM instituicaoEnsino i
JOIN Curso c
    ON i.id_InstituicaoEnsino = c.id_InstituicaoEnsino;

--4.2 Consulta: total de vagas em SP por município (simulando capital vs interior):
SELECT 
    municipio,
    SUM(numero_Vagas) AS total_vagas
FROM vw_IESVagas
GROUP BY municipio
ORDER BY total_vagas DESC;