
--CREATE DATABASE L1_01

USE L1_01

CREATE TABLE uf (
cd_uf  INT         NOT NULL IDENTITY(1,1),
nm_uf  VARCHAR(30) NOT NULL,
abr_uf CHAR(2)     NOT NULL,
CONSTRAINT pk_uf PRIMARY KEY (cd_uf)
)-- fim

CREATE TABLE Genero (
cd_Genero   INT			NOT NULL IDENTITY(100,1),
ds_Genero   VARCHAR(20)	NOT NULL,
abr_Genero  CHAR(4)     NOT NULL,
CONSTRAINT pk_Genero PRIMARY KEY (cd_Genero)
)

CREATE TABLE UndiadeMedida (
cd_UndiadeMedida   INT			NOT NULL IDENTITY(1000,1),
ds_UndiadeMedida   VARCHAR(20)	NOT NULL,
abr_UndiadeMedida  CHAR(4)     NOT NULL,
CONSTRAINT pk_UndiadeMedida PRIMARY KEY (cd_UndiadeMedida)
)


CREATE TABLE Engenheiro (
cd_Engenheiro			 INT			NOT NULL IDENTITY(2000,1),
nm_Engenheiro			 VARCHAR(40)	NOT NULL,
dt_NascimentoEngenheiro  SMALLDATETIME  NOT NULL,
nr_CPF_Engenheiro        BIGINT         NOT NULL,
nr_CREA_Engenheiro       BIGINT         NOT NULL,
dt_EmissaoCREAEng        SMALLDATETIME  NOT NULL,
cd_GeneroEngenhiro       INT            NOT NULL,
cd_UFCREA                INT            NOT NULL,
CONSTRAINT pk_Engenheiro PRIMARY KEY (cd_Engenheiro),
CONSTRAINT fk_Engenheiro_Genero FOREIGN KEY (cd_GeneroEngenhiro)
                                REFERENCES Genero(cd_Genero),
CONSTRAINT fk_Engenheiro_UF     FOREIGN KEY (cd_UFCREA)
                                REFERENCES UF(cd_UF)
)


CREATE TABLE Produto (
cd_Produto			 INT			NOT NULL IDENTITY(5000,1),
ds_Produto           VARCHAR(50)    NOT NULL,
nm_Produto           VARCHAR(20)    NOT NULL,
vlr_PrecoProuto      DECIMAL(10,2)  NOT NULL,    -- 99999999,99
vlr_PesoProduto      DECIMAL(10,4)  NOT NULL,    -- 999999,9999 
vlr_VolumeProduto    DECIMAL(12,6)  NOT NULL,    -- 999999,999999 
cd_EngenheiroResp    INT			NOT NULL,
cd_UndiadeMedidaPeso INT			NOT NULL,
cd_UndiadeMedidaVol  INT			NOT NULL,
CONSTRAINT pk_Produto PRIMARY KEY (cd_Produto),

CONSTRAINT fk_Produto_Engenheiro  FOREIGN KEY (cd_EngenheiroResp)
                                  REFERENCES Engenheiro(cd_Engenheiro),
CONSTRAINT fk_Produto_UnidMedPeso FOREIGN KEY (cd_UndiadeMedidaPeso)
                                  REFERENCES UndiadeMedida(cd_UndiadeMedida),
CONSTRAINT fk_Produto_UnidMedVol  FOREIGN KEY (cd_UndiadeMedidaVol)
                                  REFERENCES UndiadeMedida(cd_UndiadeMedida)
)



