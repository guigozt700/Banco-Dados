create database Aula1909
use Aula1909

--Adiciona ou subtrai a partir de uma data
--Ex: (tipo, quantidade, dataAtual)
select DATEADD(DD, 10, GETDATE())
select DATEADD(MM, 3, GETDATE())

--calcular a diferença entre duas datas
select DATEDIFF(DD, '20151010', GETDATE())

select DATENAME(DW, GETDATE())

select DATEPART(DD, GETDATE())

-- Função com retorno

CREATE FUNCTION dbo.fatorial(@numero int)
returns int
as begin
	if(@numero <= 1)
	return 1
	return @numero * dbo.fatorial(@numero - 1)
end
go

select.dbo.fatorial(3)

--Retorno de tabela
create function dbo.retornaFuncionarios(@nomeDepto varchar(30))
returns table
as
return(
	select
		e.NomeEmpr,
		e.dtNascimento,
		d.nomeDeto
	from
		Empregado e
	inner join
		Departamento d
	on
		e.CodDepto = d.CodDepto
	where
		d.nomeDepto = @nomeDepto
)




