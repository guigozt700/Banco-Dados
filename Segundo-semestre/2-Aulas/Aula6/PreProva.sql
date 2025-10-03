-- 1. Criação das Tabelas
create database preProva
use preProva

-- Tabela Produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

-- Tabela Clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    cidade VARCHAR(100),
    telefone VARCHAR(20),
    data_cadastro DATE
);

-- Tabela Pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    valor_total DECIMAL(10, 2),
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela Funcionários
CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    salario DECIMAL(10, 2),
    setor VARCHAR(50),
    departamento_id INT
);

-- Tabela Departamentos
CREATE TABLE departamentos (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

-- 2. Inserção de Dados

-- Inserindo Produtos
INSERT INTO produtos (id, nome, preco) VALUES (1, 'Mouse', 80.00);
INSERT INTO produtos (id, nome, preco) VALUES (2, 'Teclado', 120.00);
INSERT INTO produtos (id, nome, preco) VALUES (3, 'Monitor', 950.00);

-- Inserindo Clientes
INSERT INTO clientes (id, nome, idade, cidade, telefone, data_cadastro) 
VALUES (1, 'João', 30, 'São Paulo', '11987654321', '2023-01-15');
INSERT INTO clientes (id, nome, idade, cidade, telefone, data_cadastro) 
VALUES (2, 'Maria', 28, 'Rio de Janeiro', '21987654321', '2022-08-10');
INSERT INTO clientes (id, nome, idade, cidade, telefone, data_cadastro) 
VALUES (3, 'Pedro', 35, 'São Paulo', '11912345678', '2023-05-20');

-- Inserindo Pedidos
INSERT INTO pedidos (id, cliente_id, valor_total, data_pedido) 
VALUES (1, 1, 150.00, '2023-06-15');
INSERT INTO pedidos (id, cliente_id, valor_total, data_pedido) 
VALUES (2, 2, 0.00, '2022-12-01');
INSERT INTO pedidos (id, cliente_id, valor_total, data_pedido) 
VALUES (3, 3, 250.00, '2023-07-10');

-- Inserindo Funcionários
INSERT INTO funcionarios (id, nome, salario, setor, departamento_id) 
VALUES (1, 'Carlos', 3500.00, 'TI', 1);
INSERT INTO funcionarios (id, nome, salario, setor, departamento_id) 
VALUES (2, 'Ana', 4500.00, 'Marketing', 2);
INSERT INTO funcionarios (id, nome, salario, setor, departamento_id) 
VALUES (3, 'Lucas', 3000.00, 'TI', 1);

-- Inserindo Departamentos
INSERT INTO departamentos (id, nome) 
VALUES (1, 'Tecnologia');
INSERT INTO departamentos (id, nome) 
VALUES (2, 'Marketing');

-- 3. Testando algumas consultas SQL

--1 *B
select * from produtos
order by nome ASC

--2 *C
select distinct cidade
from clientes

--3 *B
select * from clientes
where idade > 25 and cidade = 'São Paulo'

--4 *B
select nome, salario
from funcionarios
where salario between 3000 and 5000;

--5 *A
select top 5 * from clientes
order by data_cadastro desc

--6 *B
insert into produtos
(id, nome, preco) values
(10, 'Mouse', 80.00)

--7 *A
update clientes
set telefone = '1199999'
where id = 3

-- 8 *C
delete from pedidos
where valor_total = 0

-- 9 *A
select cidade, count(id) as QuantPessoas
from clientes
group by cidade

--10 *B
select c.nome, count(p.id) as 'Total Pedidos'
from clientes c
inner join
	pedidos p on p.cliente_id = c.id
group by
	nome


--11 *B
select d.nome, count(f.id)
from departamentos d
left join
	funcionarios f on d.id = f.departamento_id
group by d.nome;

--12 *A
 SELECT AVG(salario) FROM funcionarios WHERE setor = 'TI';

--13 *B
-- Um registro (tupla)

--14 *B
--Não pode ser nula e deve ser única.

--15 *B
--Pode ser nula, desde que o relacionamento permita.

--16 *A
--Um cliente pode ter vários pedidos

--17 *B 
-- Cliente (1,N) — Pedido (1,1)

--18 *B
-- Uma tabela virtual baseada em uma consulta SQL

--19 *B
--Melhorar o desempenho das consultas.

--20 *C
--DROP VIEW vw_clientes;






