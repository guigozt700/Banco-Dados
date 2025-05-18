-- GUILHERME GOMES DA SILVA

-- DESAFIO 1 LISTA 2

CREATE DATABASE Desafio1Lista2

USE Desafio1Lista2

CREATE TABLE OrgaoEmissorRG(
	cd_OrgaoEmissorRG INT IDENTITY(1,1),
	ds_OrgaoEmissorRG VARCHAR(40) NOT NULL,
	abr_OrgaoEmissorRG VARCHAR(10) NOT NULL,
	CONSTRAINT pk_OrgaoEmissorRG PRIMARY KEY(cd_OrgaoEmissorRG)
)

CREATE TABLE OrgaoEmissorCRM(
	cd_OrgaoEmissorCRM INT IDENTITY(1,1),
	ds_OrgaoEmissorCRM VARCHAR(40) NOT NULL,
	abr_OrgaoEmissorCRM VARCHAR(10) NOT NULL,
	CONSTRAINT pk_OrgaoEmissorCRM PRIMARY KEY(cd_OrgaoEmissorCRM)
)

CREATE TABLE Genero(
	cd_Genero INT IDENTITY(1,1),
	ds_Genero VARCHAR(20) NOT NULL,
	abr_Genero CHAR(1) NOT NULL,
	CONSTRAINT pk_Genero PRIMARY KEY(cd_Genero)
)

CREATE TABLE InstituicaoEnsino(
	cd_InstituicaoEnsino INT IDENTITY(1,1),
	nm_InstituicaoEnsino VARCHAR(40) NOT NULL,
	CONSTRAINT pk_InstituicaoEnsino PRIMARY KEY(cd_InstituicaoEnsino)
)

CREATE TABLE Especialidade(
	cd_Especialidade INT IDENTITY(1,1),
	nm_Especialidade VARCHAR(30) NOT NULL,
	abr_Especialidade VARCHAR(10) NOT NULL,
	CONSTRAINT pk_Especialidade PRIMARY KEY(cd_Especialidade)
)

CREATE TABLE Medico(
	cd_Medico INT IDENTITY(1,1),
	nm_Medico VARCHAR(20) NOT NULL,
	dt_NascimentoMedico DATE NOT NULL,
	cd_GeneroMedico INT NOT NULL,
	dt_EmissaoRGMedico DATE NOT NULL,
	cd_OrgaoEmissorRGMedico INT NOT NULL,
	nr_RGMedico VARCHAR(11) NOT NULL,
	nr_CRMMedico VARCHAR(15) NOT NULL,
	dt_EmissaoCRMMedico DATE NOT NULL,
	cd_OrgaoEmissorCRMMedico INT NOT NULL,
	nr_CPFMedico BIGINT NOT NULL,
	CONSTRAINT pk_Medico PRIMARY KEY(cd_Medico),
	CONSTRAINT fk_Genero FOREIGN KEY(cd_GeneroMedico) REFERENCES Genero(cd_Genero),
	CONSTRAINT fk_OrgaoEmissorRG FOREIGN KEY(cd_OrgaoEmissorRGMedico) REFERENCES OrgaoEmissorRG(cd_OrgaoEmissorRG),
	CONSTRAINT fk_OrgaoEmissorCRM FOREIGN KEY(cd_OrgaoEmissorCRMMedico) REFERENCES OrgaoEmissorCRM(cd_OrgaoEmissorCRM)
)

CREATE TABLE MedicoEspecialidade( --Tabela Associativa
	cd_Medico INT NOT NULL,
	cd_Especialidade INT NOT NULL,
	dt_ConclusaoEspecialidade DATE NOT NULL,
	cd_InstituicaoEnsino INT NOT NULL,
	CONSTRAINT pk_MedicoEspecialidade PRIMARY KEY(cd_Medico, cd_Especialidade), --Define os dois campos como PK
	CONSTRAINT fk_Medico FOREIGN KEY(cd_Medico) REFERENCES Medico(cd_Medico),   --Define a PK (Medico) como chave FK
	CONSTRAINT fk_Especialidade FOREIGN KEY(cd_Especialidade) REFERENCES Especialidade(cd_Especialidade), -- Define tambem a PK (Especialidade) como FK
	CONSTRAINT fk_InstituicaoEnsino FOREIGN KEY(cd_InstituicaoEnsino) REFERENCES InstituicaoEnsino(cd_InstituicaoEnsino)
)

-- INSERÇÕES NAS TABELAS

INSERT INTO OrgaoEmissorRG (ds_OrgaoEmissorRG, abr_OrgaoEmissorRG)
VALUES 
('Secretaria de Segurança Pública', 'SSP'),
('Polícia Civil', 'PC');

INSERT INTO OrgaoEmissorCRM (ds_OrgaoEmissorCRM, abr_OrgaoEmissorCRM)
VALUES 
('Conselho Regional de Medicina de SP', 'CRM-SP'),
('Conselho Regional de Medicina de RJ', 'CRM-RJ');

INSERT INTO Genero (ds_Genero, abr_Genero)
VALUES 
('Masculino', 'M'),
('Feminino', 'F');

INSERT INTO InstituicaoEnsino (nm_InstituicaoEnsino)
VALUES 
('Universidade de São Paulo'),
('Universidade Federal do Rio de Janeiro');

INSERT INTO Especialidade (nm_Especialidade, abr_Especialidade)
VALUES 
('Cardiologia', 'CARD'),
('Neurologia', 'NEUR'),
('Pediatria', 'PED');

INSERT INTO Medico (
	nm_Medico, dt_NascimentoMedico, cd_GeneroMedico, dt_EmissaoRGMedico,
	cd_OrgaoEmissorRGMedico, nr_RGMedico, nr_CRMMedico, dt_EmissaoCRMMedico,
	cd_OrgaoEmissorCRMMedico, nr_CPFMedico)
VALUES
('João Silva', '1980-05-15', 1, '2000-06-10', 1, '12345678900', '12345-SP', '2005-01-01', 1, 12345678901),
('Maria Oliveira', '1985-09-20', 2, '2003-02-12', 2, '98765432100', '54321-RJ', '2008-03-15', 2, 98765432109);

INSERT INTO MedicoEspecialidade (cd_Medico, cd_Especialidade, dt_ConclusaoEspecialidade, cd_InstituicaoEnsino)
VALUES
(1, 1, '2005-12-01', 1), -- João Silva - Cardiologia - USP
(1, 3, '2006-11-15', 1), -- João Silva - Pediatria - USP
(2, 2, '2010-07-20', 2); -- Maria Oliveira - Neurologia - UFRJ

SELECT * FROM MedicoEspecialidade;
SELECT * FROM Medico;
SELECT * FROM Especialidade;
SELECT * FROM OrgaoEmissorRG;
SELECT * FROM OrgaoEmissorCRM;
SELECT * FROM Genero;

