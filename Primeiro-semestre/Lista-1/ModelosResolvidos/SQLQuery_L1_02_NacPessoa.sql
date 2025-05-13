--CREATE DATABASE L1_02
USE L1_02

CREATE TABLE Pais(
cd_pais INT			not null IDENTITY(10,1),
nm_pais VARCHAR(40) not null,
CONSTRAINT pk_pais  PRIMARY KEY (cd_pais)
)

CREATE TABLE Nacionalidade(
cd_nacionalidade      INT         not null IDENTITY(10,1),
nm_nacionalidade      VARCHAR(40) not null,
cd_paisNacionalidade  INT         not null,
CONSTRAINT pk_nacionalidade     PRIMARY KEY (cd_nacionalidade),
CONSTRAINT fk_paisNacionalidade FOREIGN KEY (cd_paisNacionalidade) 
                                REFERENCES Pais(cd_pais)
)

CREATE TABLE Genero(
cd_genero    INT         not null IDENTITY(10,1),
ds_genero    VARCHAR(40) not null,
abr_genero   CHAR(10)    not null,
CONSTRAINT pk_genero PRIMARY KEY (cd_genero)
)

CREATE TABLE OrgaoEmissorRG(
cd_orgaoEmissorRG   INT         not null IDENTITY(10,1),
ds_orgaoEmissorRG   VARCHAR(40) not null,
abr_OrgaoEmissorRG  VARCHAR(10) not null,
CONSTRAINT pk_orgaoEmissorRG PRIMARY KEY (cd_orgaoEmissorRG)
)

CREATE TABLE Pessoa(
cd_pessoa              INT not null IDENTITY(10,1),
nm_pessoa              VARCHAR(40),
dt_NascPessoa          SMALLDATETIME,
cd_generoPessoa        INT           NOT NULL,
cd_nacionalidadePessoa INT			 NOT NULL,
dt_emissaoRG           SMALLDATETIME,
cd_orgaoEmissorRG      INT           NOT NULL,          
NR_RG                  INT,
NR_CPF                 INT,
CONSTRAINT pk_pessoa                PRIMARY KEY (cd_pessoa),
CONSTRAINT fk_pessoa_generoPessoa   FOREIGN KEY (cd_generoPessoa) 
                                    REFERENCES Genero (cd_genero),
CONSTRAINT fk_pessoa_Nac            FOREIGN KEY (cd_nacionalidadePessoa) 
                                    REFERENCES Nacionalidade (cd_nacionalidade),
CONSTRAINT fk_pessoa_orgaoEmissorRG FOREIGN KEY (cd_orgaoEmissorRG) 
                                    REFERENCES OrgaoEmissorRG(cd_orgaoEmissorRG)
)
