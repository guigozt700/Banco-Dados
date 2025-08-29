create table Empregado(
	codigoEmpregado int identity(1,1),
	nomeEmpregado varchar(100) not null,
	dataNascimento datetime not null,
	codigoDepartamento int not null
)

insert into Empregado
(nomeEmpregado, dataNascimento, codigoDepartamento) values
('Igor', '01/01/2000', 2)

alter table Empregado
add Endereco varchar(100) not null

alter table Empregado
alter column Endereco varchar(120) null

create table Empregado2(
	codigoEmpregado int identity(1,1) primary key,
	nomeEmpregado varchar(100),
	dataNascimento datetime,
	codigoDepartamento int not null,
	sexoEmpregado char(1) not null,
	constraint ck_sexoEmpregado check (sexoEmpregado in ('F','M')),
	salarioEmpregado money not null,
	constraint ck_salarioEmpregado check (salarioEmpregado > 0 and salarioEmpregado < 10000)
)

insert into Empregado2
(nomeEmpregado, dataNascimento, codigoDepartamento, sexoEmpregado, salarioEmpregado) values
('Josef Jostar', '01/01/2000', 2, 'M', 3000)

create table Departamento(
	codigoDepartamento int identity(1,1),
	nomeDepto varchar(20)
	constraint pk_idDepartamento primary key (codigoDepartamento)
)


create table Empregado3(
	codigoEmpregado int identity(1,1),
	nomeEmpregado varchar(100) not null,
	dataNascimento datetime not null,
	codigoDepartamento int,
	constraint pk_idEmpregado primary key(codigoEmpregado),
	constraint fk_idDepartamento foreign key(codigoDepartamento) references Departamento (codigoDepartamento)
)

insert into Departamento
(nomeDepto) values
('TI')

insert into Empregado3
(nomeEmpregado, dataNascimento, codigoDepartamento) values
('Jotaro', '13/04/2005', 1)


