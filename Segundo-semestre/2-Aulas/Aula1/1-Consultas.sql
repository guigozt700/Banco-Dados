select * from empregados;

select Departamento, Salario 
from empregados;

select Departamento, Salario, Salario * 1.1
from empregados;

select Departamento, Salario, Salario * 1.1 + 100
from empregados;

select Departamento, Salario, Salario * (1.1 + 100)
from empregados;

-- EMPREGADOS NULL -------------------------------------------------

select * from Empregadosnull

select nome, salario, salario * 1.1
from Empregadosnull

-- isnull tranforma os valores nulos de uma coluna em outro valor, no caso "0"
select Nome, Salario, isnull (Salario, 0) + 1000
from Empregadosnull

select Nome, Salario, isnull (Salario, 0) + 1000 as SalarioBonus
from Empregadosnull

select Nome, Salario, isnull (Salario, 0) + 1000 'Salário Bônus'
from Empregadosnull

select Nome + ' - ' + Departamento 'Nome e Departamento', Salario 'Salário'
from Empregadosnull

select distinct Departamento
from Empregadosnull

select Nome, Departamento, Salario, Cidade
from empregadosnull
where Departamento = 'Financeiro'

select Nome, Departamento, Salario, Cidade
from Empregadosnull
where Cidade = 'São Paulo'

select Nome, Departamento, Salario, Cidade
from Empregadosnull
where Salario > 4000

select Nome, Departamento, Salario, Cidade
from Empregadosnull
where Salario < 1500

select Nome, Departamento, Salario, Cidade
from Empregadosnull
where Salario > 4000 and Salario < 6000

select Nome, Departamento, Salario, Cidade
from Empregadosnull
where Salario > 4000 or Salario < 6000

-- Like percorre uma sequencia

select Nome, Departamento
from Empregadosnull
where Nome like '%Gomes'

select Nome, Departamento
from Empregadosnull
where Nome like '%na%'

select Nome, Departamento
from Empregadosnull
where Nome like '_n_ Silva'

-- Between percorre valores dentro do intervalo
select Nome, Salario, Departamento
from Empregadosnull
where Salario between 6000 and 10000

-- In pega apenas valores iguais a clausula (4500 ou 4800)
select Nome, Salario, Departamento
from Empregadosnull
where Salario in (4500, 4800)

select Nome, Salario, Departamento
from Empregadosnull
where Salario is null

select Nome, Salario, Departamento
from Empregadosnull
order by Salario

select Nome, Salario, Departamento
from Empregadosnull
order by Salario desc

-- Faz os calculos dos salarios, e agrupa de acordo com o departamento
select Departamento, sum(Salario) as TotalSalario, avg(Salario) as MediaSalario, max(Salario) as MaiorSalario, min(Salario) as MenorSalario
from Empregadosnull
group by Departamento

select Departamento, count(*) as Pessoas
from Empregadosnull
group by Departamento having count(*) > 1

-- SUB QUERYES

-- Seleciona o maior salario médio dos departamentos (1ª)
select top 1 Departamento
from Empregadosnull
group by Departamento
order by avg(Salario) desc

-- Busca pra retornar o nome de acordo com o select anterior (2ª)
select Nome, Salario
from empregados
where Departamento = 'Tecnologia'

-- OUTRA FORMA=-------------

-- Seleciona os empregos de acordo com a subQuery
select Nome, Salario
from empregados
where Departamento in (
	select top 1 Departamento
	from empregados
	group by Departamento
	order by avg(Salario) desc
	) --Onde retorne o departamento com maior salario médio


-- INNER JOIN

select empregados.Nome, empregados.Salario, Empregadosnull.Salario
from empregados
inner join Empregadosnull --Junta com a outra tabela
on empregados.Nome = Empregadosnull.Nome --Conexão entre as duas tabelas

select empregados.Nome, empregados.Salario, empregadosjoin.Salario
from empregados
left join empregadosjoin
on empregados.nome = empregadosjoin.Nome

select empregados.Nome, empregados.Salario, empregadosjoin.Salario
from empregados
right join empregadosjoin
on empregados.nome = empregadosjoin.Nome
