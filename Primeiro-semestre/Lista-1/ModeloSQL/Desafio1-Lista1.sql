CREATE DATABASE Desafio1Lista1

USE Desafio1Lista1

CREATE TABLE Produto(
cd_Produto int not null IDENTITY(1,1),
CONSTRAINT pk_Produto PRIMARY KEY(cd_Produto),
ds_Produto varchar(20) not null,
nm_Produto varchar(20) not null,
vlr_precoCustoProduto decimal(5,2) not null,
vlr_pesoProduto decimal(5,2) not null,
vlr_volumeProduto decimal(5,2) not null,
peso_UnidadeMedida decimal(3,1) not null,
CONSTRAINT fk_peso_UnidadeMedida FOREIGN KEY peso_UnidadeMedida REFERENCES UnidadeMedida(cd_UnidadeMedida),
volume_UnidadeMedida decimal(3,1) not null,
CONSTRAINT fk_volume_UnidadeMeida FOREIGN KEY volume_UnidadeMedida REFERENCES UnidadeMedida(cd_UnidadeMedida)
)

CREATE TABLE UnidadeMedida(
cd_UnidadeMedida int not null IDENTITY(1,1),
CONSTRAINT pk_UnidadeMedida PRIMARY KEY(cd_UnidadeMedida), 
nm_UnidadeMedida varchar(20),
abr_UnidadeMedida varchar(20)
)

CREATE TABLE Engenherio(
cd_Engenheiro int not null IDENTITY(1,1),
CONSTRAINT pk
)