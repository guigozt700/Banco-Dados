create database Aula1209
use Aula1209

-- Criar tabela de Departamentos
CREATE TABLE Departamento (
    CodDepto INT PRIMARY KEY,
    NomeDepto VARCHAR(100) NOT NULL
);
 
-- Inserir alguns Departamentos
INSERT INTO Departamento (CodDepto, NomeDepto) VALUES
(1, 'Recursos Humanos'),
(2, 'Financeiro'),
(3, 'TI'),
(4, 'Marketing');
 
-- Criar tabela de Empregados
CREATE TABLE Empregado (
    CodEmpr INT PRIMARY KEY,
    NomeEmpr VARCHAR(150) NOT NULL,
    DtNascimento DATE NOT NULL,
    CodDepto INT NOT NULL,
    FOREIGN KEY (CodDepto) REFERENCES Departamento(CodDepto)
);
 
-- Inserir alguns Empregados
INSERT INTO Empregado (CodEmpr, NomeEmpr, DtNascimento, CodDepto) VALUES
(101, 'Ana Souza', '1990-05-12', 1),
(102, 'Carlos Silva', '1985-08-23', 2),
(103, 'Mariana Oliveira', '1992-11-02', 3),
(104, 'João Pereira', '1988-03-15', 3),
(105, 'Fernanda Lima', '1995-07-30', 4);

-- Criar View ------------------------------------------

Create View 
	v_Empregado as	--Nome da View
select
	NomeEmpr, DtNascimento, NomeDepto --Colunas
from
	Empregado	--Da tabela empregado
inner join
	Departamento	--Junta com Departamento
on
	Departamento.CodDepto = Empregado.CodDepto	--Onde a coluna Departamento.CodDepto seja igual a Empregado.CodDepto

select * from v_Empregado

-- Alterar View ------------------------------------------

alter view 
	v_Empregado as
select 
	NomeEmpr, NomeDepto
from
	Empregado
inner join
	Departamento
on
	Departamento.CodDepto = Empregado.CodDepto

--Apagando View ------------------------------

drop view v_Empregado

-- Criação de variavis -------------------------

declare @codigo int, @nome varchar(50)
set @codigo = 1
set @nome = 'Manuel'

declare @codigo2 int = 10
declare @nome2 varchar(50) = 'José Maria'

select @nome2 as variavel


-- Funções ----------------------------------------

select ASCII ('A') --Retorna 65
select ASCII ('SQL') --Retorna 83

select CHAR(65)
select CHAR(37) --Retorna %

select LEFT('SQL SERVER', 3) --Retorna SQL

select LEN('SQL SERVER') --Retorna 10

select REPLACE('SQL SERVER', 'SQL', 'BANCO')

select REVERSE('SUBINOONIBUS')
