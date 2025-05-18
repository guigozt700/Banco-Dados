CREATE DATABASE Desafio2Lista3;

USE Desafio2Lista3;

CREATE TABLE Genero (
	cd_Genero INT IDENTITY(1,1),
	ds_Genero VARCHAR(20) NOT NULL,
	abr_Genero CHAR(1) NOT NULL,
	CONSTRAINT pk_Genero PRIMARY KEY (cd_Genero)
);

CREATE TABLE Nacionalidade (
	cd_Nacionalidade INT IDENTITY(1,1),
	ds_Nacionalidade VARCHAR(30) NOT NULL,
	nm_Nacionalidade VARCHAR(30) NOT NULL,
	CONSTRAINT pk_Nacionalidade PRIMARY KEY (cd_Nacionalidade)
);

CREATE TABLE Empresa (
	cd_Empresa INT IDENTITY(1,1),
	nm_Empresa VARCHAR(50) NOT NULL,
	CONSTRAINT pk_Empresa PRIMARY KEY (cd_Empresa)
);

CREATE TABLE Profissao (
	cd_Profissao INT IDENTITY(1,1),
	ds_Profissao VARCHAR(40) NOT NULL,
	vlr_Salario DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_Profissao PRIMARY KEY (cd_Profissao)
);

CREATE TABLE Banco (
	cd_Banco INT IDENTITY(1,1),
	nm_Banco VARCHAR(50) NOT NULL,
	nr_Banco VARCHAR(10) NOT NULL,
	CONSTRAINT pk_Banco PRIMARY KEY (cd_Banco)
);

CREATE TABLE PessoaFisica (
	cd_PessoaFisica INT IDENTITY(1,1),
	nm_PessoaFisica VARCHAR(50) NOT NULL,
	dt_NascPessoaFisica DATE NOT NULL,
	cd_GeneroPessoaFisica INT NOT NULL,
	dt_RGEmissaoPessoaFisica DATE NOT NULL,
	nr_endereco VARCHAR(100) NOT NULL,
	txt_enderecoComplemento VARCHAR(100),
	nr_enderecoCEP CHAR(8) NOT NULL,
	NR_RGPessoaFisica VARCHAR(12) NOT NULL,
	vlr_SalarioPessoaFisica DECIMAL(10,2),
	cd_EmpresaTrabalho INT,
	cd_NacionalidadePessoaFisica INT,
	cd_Profissao INT,
	NR_TelefoneResidencial VARCHAR(15),
	NR_TelefoneCelular VARCHAR(15),
	NR_CPFPessoaFisica BIGINT NOT NULL,
	CONSTRAINT pk_PessoaFisica PRIMARY KEY (cd_PessoaFisica),
	CONSTRAINT fk_GeneroPessoaFisica FOREIGN KEY (cd_GeneroPessoaFisica) REFERENCES Genero(cd_Genero),
	CONSTRAINT fk_EmpresaTrabalho FOREIGN KEY (cd_EmpresaTrabalho) REFERENCES Empresa(cd_Empresa),
	CONSTRAINT fk_NacionalidadePessoaFisica FOREIGN KEY (cd_NacionalidadePessoaFisica) REFERENCES Nacionalidade(cd_Nacionalidade),
	CONSTRAINT fk_ProfissaoPessoaFisica FOREIGN KEY (cd_Profissao) REFERENCES Profissao(cd_Profissao)
);

CREATE TABLE Financiamento (
	cd_Financiamento INT IDENTITY(1,1),
	vlr_Financiamento DECIMAL(10,2) NOT NULL,
	dt_InicioFinanciamento DATE NOT NULL,
	qtd_ParcelaFinanciamento INT NOT NULL,
	nr_ContratoFinanciamento VARCHAR(20) NOT NULL,
	cd_PessoaFisicaFinanciamento INT NOT NULL,
	CONSTRAINT pk_Financiamento PRIMARY KEY (cd_Financiamento),
	CONSTRAINT fk_PessoaFisicaFinanciamento FOREIGN KEY (cd_PessoaFisicaFinanciamento) REFERENCES PessoaFisica(cd_PessoaFisica)
);

CREATE TABLE FinanciamentoParcela (
	cd_Financiamento INT NOT NULL,
	cd_FinanciamentoParcela INT NOT NULL,
	nr_parcela INT NOT NULL,
	vlr_descontoParcela DECIMAL(10,2),
	vlr_MultaParcela DECIMAL(10,2),
	dt_PgtoParcela DATE,
	vlr_PgtoParcela DECIMAL(10,2),
	cd_BancoPgto INT,

	CONSTRAINT pk_FinanciamentoParcela PRIMARY KEY (cd_Financiamento, cd_FinanciamentoParcela),
	CONSTRAINT fk_FinanciamentoParcela_Financiamento FOREIGN KEY (cd_Financiamento) REFERENCES Financiamento(cd_Financiamento),
	CONSTRAINT fk_FinanciamentoParcela_Banco FOREIGN KEY (cd_BancoPgto) REFERENCES Banco(cd_Banco)
);

-- INSERÇÕES NAS TABELAS ---------------------

INSERT INTO Genero (ds_Genero, abr_Genero)
VALUES 
  ('Masculino', 'M'),
  ('Feminino', 'F'),
  ('Outro', 'O');

  INSERT INTO Nacionalidade (ds_Nacionalidade, nm_Nacionalidade)
VALUES 
  ('Brasileira', 'Brasil'),
  ('Portuguesa', 'Portugal'),
  ('Italiana', 'Itália');

INSERT INTO Empresa (nm_Empresa)
VALUES 
  ('Tech Solutions LTDA'),
  ('Construtora Alfa'),
  ('Serviços Médicos S/A');

INSERT INTO Profissao (ds_Profissao, vlr_Salario)
VALUES 
  ('Engenheiro de Software', 8500.00),
  ('Médico', 12000.00),
  ('Arquiteto', 7000.00);

INSERT INTO Banco (nm_Banco, nr_Banco)
VALUES 
  ('Banco do Brasil', '001'),
  ('Caixa Econômica', '104'),
  ('Bradesco', '237');

INSERT INTO PessoaFisica (
	nm_PessoaFisica, dt_NascPessoaFisica, cd_GeneroPessoaFisica, dt_RGEmissaoPessoaFisica,
	nr_endereco, txt_enderecoComplemento, nr_enderecoCEP, NR_RGPessoaFisica, vlr_SalarioPessoaFisica,
	cd_EmpresaTrabalho, cd_NacionalidadePessoaFisica, cd_Profissao,
	NR_TelefoneResidencial, NR_TelefoneCelular, NR_CPFPessoaFisica
)
VALUES 
  ('Carlos Eduardo Silva', '1985-06-20', 1, '2005-08-10', 'Rua das Flores, 123', 'Apto 202', '01234000', 'MG1234567', 8500.00, 1, 1, 1, '1133445566', '11987654321', 12345678901),
  ('Ana Paula Mendes', '1990-12-15', 2, '2010-04-05', 'Av. Central, 456', NULL, '04567000', 'SP9876543', 12000.00, 3, 1, 2, '1122334455', '11912345678', 23456789012);

INSERT INTO Financiamento (
	vlr_Financiamento, dt_InicioFinanciamento, qtd_ParcelaFinanciamento, nr_ContratoFinanciamento, cd_PessoaFisicaFinanciamento
)
VALUES 
  (100000.00, '2023-01-15', 24, 'FIN001', 1),
  (150000.00, '2023-06-10', 36, 'FIN002', 2);


INSERT INTO FinanciamentoParcela (
	cd_Financiamento, cd_FinanciamentoParcela, nr_parcela, vlr_descontoParcela,
	vlr_MultaParcela, dt_PgtoParcela, vlr_PgtoParcela, cd_BancoPgto
)
VALUES 
  (1, 1, 1, 100.00, 0.00, '2023-02-15', 4100.00, 1),
  (1, 2, 2, 0.00, 50.00, '2023-03-15', 4150.00, 1),
  (2, 1, 1, 200.00, 0.00, '2023-07-10', 4100.00, 2);

SELECT * FROM PessoaFisica
SELECT * FROM Financiamento
SELECT * FROM FinanciamentoParcela
SELECT * FROM Banco

