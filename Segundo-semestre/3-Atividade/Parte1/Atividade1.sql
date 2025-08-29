create database AtividadePart2;
use AtividadePart2;

create table Departamento 
(  
   IdDepto int  NOT NULL, 
   NomeDepto  varchar(15) NOT NULL, 
   Gerente int         NOT NULL, 
   Divisao varchar(10) NOT NULL, 
   Local  varchar(15) NOT NULL, 
PRIMARY KEY  (IdDepto) 
) 
 
create table Empregado 
( 
   IdEmpregado  int NOT NULL, 
   NomeEmpregado  varchar(20) NOT NULL, 
   IdDepto  int NOT NULL, 
   Cargo   varchar(20) NOT NULL, 
   Tempo_Emp      int   NULL, 
   Salario  decimal(10,2) NULL, 
   Comissao  decimal(10,2) NULL
   PRIMARY KEY  (IdEmpregado) 
)

-- Inserindo dados na tabela Departamento
INSERT INTO Departamento (IdDepto, NomeDepto, Gerente, Divisao, Local) VALUES
(10, 'Vendas',     101, 'Comercial', 'São Paulo'),
(20, 'RH',         102, 'Pessoas',   'Rio de Janeiro'),
(30, 'TI',         103, 'Suporte',   'Belo Horizonte'),
(40, 'Financeiro', 104, 'Admin',     'Curitiba'),
(50, 'Marketing',  105, 'Comercial', 'Porto Alegre');

-- Inserindo dados na tabela Empregado
INSERT INTO Empregado (IdEmpregado, NomeEmpregado, IdDepto, Cargo, Tempo_Emp, Salario, Comissao) VALUES
(101, 'Ana Souza',        10, 'Gerente',   8, 12000.00, NULL),
(102, 'Carlos Pereira',   20, 'Gerente',   6, 11000.00, NULL),
(103, 'Mariana Lima',     30, 'Gerente',   10, 13000.00, NULL),
(104, 'João Silva',       40, 'Gerente',   12, 14000.00, NULL),
(105, 'Fernanda Costa',   50, 'Gerente',   5, 10000.00, NULL),

(201, 'Paulo Santos',     10, 'Vendedor',  3, 4000.00,  800.00),
(202, 'Ricardo Mendes',   10, 'Vendedor',  2, 3800.00, 1200.00),
(203, 'Luciana Alves',    20, 'Analista',  4, 5000.00, NULL),
(204, 'Patrícia Ramos',   30, 'Dev',       6, 7000.00, NULL),
(205, 'Gabriel Rocha',    30, 'Suporte',   1, 3000.00, NULL),
(206, 'Juliana Martins',  40, 'Analista',  7, 6000.00, NULL),
(207, 'Bruno Oliveira',   50, 'Designer',  2, 4500.00, NULL);


--1. Lista Nome e salário de todos os Empregados. 
select NomeEmpregado, Salario
from Empregado

--2. Lista Nome e Local de todos os Departamentos. 
select NomeDepto, Local
from Departamento

--3. Lista Nome, salário e comissão dos Empregados com salario maior que  1.800.b 
select NomeEmpregado, Salario, Comissao
from Empregado
where Salario > 1800

--4. Lista Nome, divisão e Local dos Departamentos da divisão SUL.   
select NomeDepto, Divisao, Local
from Departamento
where Divisao = 'Sul'

--5. Lista Nome, divisão e Local dos Departamentos da divisão SUL.   
select NomeDepto, Divisao, Local
from Departamento
where Local = 'Sul'

--6 Lista Nome, departamento, salario e cargo dos Empregados com cargo GER e salário menor que 2.000.
select NomeEmpregado, NomeDepto, Salario, Cargo
from Empregado
inner join Departamento
on Empregado.IdDepto = Departamento.IdDepto
where Cargo like 'GER%'

-- 6. Lista todos os dados dos Empregados com cargo ATEND ou salário entre 1.800 e 2.000. 
select *
from Empregado
where Cargo like 'Atend%' 
	or Salario between 1800 and 2000

--7. Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados. 
select NomeEmpregado, Salario, Comissao, Salario + isnull(Comissao, 0) 'Remuneracao Total'
from Empregado

--8. Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 700.
select NomeEmpregado, Salario, Comissao, (Salario + isnull(Comissao, 0)) 'Remuneracao Total'
from Empregado
where Salario > 2000
	or Comissao > 7000

--9. Lista Nome, Salário, comissão e remuneração total de todos os empregados com remuneração total menor que 1.800. 
select NomeEmpregado, Salario, Comissao, (Salario + isnull(Comissao, 0)) as RemuneracaoTotal
from Empregado
where (Salario + isnull(Comissao, 0)) < 1800

--10. Lista Nome e cargo dos Empregados que o nome comece com a letra D. 
select NomeEmpregado, Cargo
from Empregado
where NomeEmpregado like 'D%'

--11. Lista Nome e cargo dos Empregados que o nome tenha N como terceira letra.
select NomeEmpregado, Cargo
from Empregado
where NomeEmpregado like '__N%'

--12. Lista Nome e cargo dos Empregados que o nome tenha N (maiúscula ou minúscula) como terceira letra
select NomeEmpregado, Cargo
from Empregado
where NomeEmpregado like '__N%'
	or NomeEmpregado like '__n'

--13. Lista Nome, Salário, comissão e remuneração total  (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem alfabética de nome.
select NomeEmpregado, Salario, Comissao, Salario + isnull(Comissao, 0) 'Remuneracao Total'
from Empregado
where Salario > 2000
	or Comissao > 800
order by NomeEmpregado

--14. Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem crescente de salario. 
select NomeEmpregado, Salario, Comissao, Salario + isnull(Comissao, 0) 'Remuneracao Total'
from Empregado
where Salario > 2000
	or Comissao > 800
order by Salario

--15. Lista Nome, Salário, comissão e remuneração total (Salário + Comissão)  de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem decrescente de salario. 
select NomeEmpregado, Salario, Comissao, Salario + isnull(Comissao, 0) 'Remuneracao Total'
from Empregado
where Salario > 2000
	or Comissao > 800
order by Salario desc

--16. Lista Nome, Salário, comissão e remuneração total (Salário + Comissão) de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem crescente de remuneração total 
select NomeEmpregado, Salario, Comissao, Salario + isnull(Comissao, 0) 'Remuneracao Total'
from Empregado
where Salario > 2000
	or Comissao > 800
order by Salario + isnull(Comissao, 0)

--17. Lista Nome, Salário, comissão e remuneração total de todos os empregados com salário maior que 2.000 ou comissão maior que 800. Apresenta o resultado classificado em ordem crescente de departamento e em cada departamento, em ordem decrescente de salario. 
select NomeDepto, NomeEmpregado, Salario, Comissao, Salario + isnull(Comissao, 0) 'Remuneracao Total'
from Empregado
inner join Departamento
on Empregado.IdDepto = Departamento.IdDepto
where Salario > 2000
	or Comissao > 800
order by NomeDepto asc, Salario desc

--18. Lista o maior salário, o menor salário e a média dos salários de todos os Empregados. 
select max(Salario) 'Maior Salario', min(Salario) 'Menor Salario', avg(Salario) 'Media Salarios'
from Empregado

--19. Lista o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados com cargo GER ou VENDAS. 
select max(Salario) 'Maior Salario', min(Salario) 'Menor Salario', avg(Salario) 'Media Salarios', count(*) 'Funcionarios GER or Vendas'
from Empregado
where Cargo like 'ger%'
	or Cargo = 'Vendas'

--20. Lista  o cargo, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada cargo 
select Cargo, max(Salario) 'Maior Salario', min(Salario) 'Menor Salario', avg(Salario) 'Media Salarios', count(*) 'Qtd Funcionarios'
from Empregado
group by Cargo

--21. Lista  o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada departamento 
select NomeDepto, max(Salario) 'Maior Salario', min(Salario) 'Menor Salario', avg(Salario) 'Media Salarios', count(*) 'Qtd Funcionarios'
from Departamento
inner join Empregado
on Departamento.IdDepto = Empregado.IdDepto
group by NomeDepto

--22. Lista  o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada departamento, considerando somente empregados com salário maior que 1.800 
select 
    d.nomedepto,
    max(e.salario) as maiorsalario,
    min(e.salario) as menorsalario,
    avg(e.salario) as mediasalario,
    count(*) as quantidadeempregados
from empregado e
inner join departamento d on e.iddepto = d.iddepto
where e.salario > 1800
group by d.nomedepto;

--23. Lista  o departamento, o cargo, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados para cada cargo dentro de cada departamento 
select 
    d.nomedepto,
    e.cargo,
    max(e.salario) as maiorsalario,
    min(e.salario) as menorsalario,
    avg(e.salario) as mediasalario,
    count(*) as quantidadeempregados
from empregado e
inner join departamento d on e.iddepto = d.iddepto
group by d.nomedepto, e.cargo;


--24. Lista  o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados, apresentando somente departamentos que tenham pelo menos 5 empregados.  
select 
    d.nomedepto,
    max(e.salario) as maiorsalario,
    min(e.salario) as menorsalario,
    avg(e.salario) as mediasalario,
    count(*) as quantidadeempregados
from empregado e
inner join departamento d on e.iddepto = d.iddepto
group by d.nomedepto
having count(*) >= 5;

--25. Lista  o departamento, o maior salário, o menor salário, a média dos salários e a quantidade dos Empregados com salário maior que 1.400, apresentando somente departamentos que tenham pelo menos 3 empregados nessa condição. 
select 
    d.nomedepto,
    max(e.salario) as maiorsalario,
    min(e.salario) as menorsalario,
    avg(e.salario) as mediasalario,
    count(*) as quantidadeempregados
from empregado e
inner join departamento d on e.iddepto = d.iddepto
where e.salario > 1400
group by d.nomedepto
having count(*) >= 3;

--26. Lista todos os dados dos Empregados que não tem comissão (ausência de valor). 
select * 
from Empregado
where Comissao is null

--27. Lista nome e salário dos empregados com salário menor que a média dos salários 
select nomeempregado, salario
from empregado
where salario < (select avg(salario) from empregado);

--28. Lista os códigos de departamento que tenham empregados com salário maior que a média de todos os salários (sem repetir códigos de departamento).
select distinct iddepto
from empregado
where salario > (select avg(salario) from empregado);


--29. Lista nome e salário dos empregados que tenham o menor salário em seu departamento 
select e.nomeempregado, e.salario, e.iddepto
from empregado e
inner join (
    select iddepto, min(salario) as menorsalario
    from empregado
    group by iddepto
) m on e.iddepto = m.iddepto and e.salario = m.menorsalario;


--30. Lista quantos empregados em cada departamento tem salário maior que a média de todos os salários
select iddepto, count(*) as qtdacimamedia
from empregado
where salario > (select avg(salario) from empregado)
group by iddepto;

-- 31. Quais foram suas dúvidas/dificuldades na aula e nesta Atividade? 
-- Acho que a falta de costume com as consultas mesmo, por que eu entendia o que pedia, mas demorei pra "codar"

--32. O que pode ser melhorado na aula e nesta Atividade? 
-- Um pouco menos de exercicios rs, talvez poucos exercicios mas que sejam mais completos pra resolver, eu sei que esse foi a primeira atividade, e foi bom pra praticar...
