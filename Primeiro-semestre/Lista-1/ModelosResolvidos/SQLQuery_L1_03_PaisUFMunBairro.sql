--CREATE DATABASE L1_03

USE L1_03

--REGIAO
CREATE TABLE Regiao(
cd_Regiao          int not null IDENTITY(1,1),
nm_Regiao          varchar (20),
CONSTRAINT pk_Regiao PRIMARY KEY(cd_Regiao)
);

--PAIS
CREATE TABLE Pais(
cd_Pais          int not null IDENTITY(1,1),
nm_Pais          varchar(20),
abr_Pais         char(3),
vlr_AreaPais numeric(10,2),
CONSTRAINT pk_Pais PRIMARY KEY(cd_Pais)
);

--UF
CREATE TABLE UF(
cd_UF           int not null IDENTITY(1,1),
nm_UF           varchar (20),
abr_UF          char(2),
vlr_AreaUF      numeric(10,2), --99999999,99
cd_Pais         int,
CONSTRAINT pk_UF       PRIMARY KEY (cd_UF),
CONSTRAINT fk_UF_Pais FOREIGN KEY (cd_Pais) 
                       REFERENCES Pais (cd_Pais)
);

--MUNICIPIO
CREATE TABLE Municipio(
cd_Municipio          int not null IDENTITY(1,1),
nm_Municipio          varchar(20),
vlr_AreaMunicipio     numeric(10,2), -- 99999999,99
cd_UFMunicipio        int,
cd_RegiaoMunicipio    int,
CONSTRAINT pk_Municipio       PRIMARY KEY (cd_Municipio),
CONSTRAINT fk_MunicipioUF     FOREIGN KEY (cd_UFMunicipio) 
                              REFERENCES UF (cd_UF),
CONSTRAINT fk_MunicipioRegiao FOREIGN KEY (cd_RegiaoMunicipio) 
                              REFERENCES Regiao (cd_Regiao)
);

--BAIRRO
CREATE TABLE Bairro(
cd_bairro           int not null IDENTITY(1,1),
nm_bairro           varchar(40),
cd_MunicipioBairro  int,
CONSTRAINT pk_bairro          PRIMARY KEY (cd_bairro),
CONSTRAINT fk_BairroMunicipio FOREIGN KEY (cd_MunicipioBairro)
                              REFERENCES Municipio (cd_Municipio)
);