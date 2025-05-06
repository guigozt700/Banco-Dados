--CREATE DATABASE aula0605

--USE aula0605

CREATE TABLE fatec(
cd_fatec int not null IDENTITY(10,1),
ds_fatec varchar(10),
vlr_preco decimal(10,2),
dt_fatec smalldatetime,
cd_cidade int,
CONSTRAINT pk_fatec PRIMARY KEY (cd_fatec), --Define o atributo como chave primaria (ao inves de já definir o atributo como Primary Key)
CONSTRAINT fk_cidade FOREIGN KEY(cd_cidade) REFERENCES Cidade(cd_cidade)
)

--INSERT INTO fatec VALUES ('DS1', 100.50,'2025/05/06')
--SELECT * FROM fatec
--DROP TABLE fatec

CREATE TABLE Cidade(
cd_cidade int not null IDENTITY (1,1),
nm_cidade varchar(30) not null,
CONSTRAINT pk_cidade PRIMARY KEY(cd_cidade)
)