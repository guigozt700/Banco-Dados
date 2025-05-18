-- GUILHERME GOMES DA SILVA

-- DESAFIO 1 LISTA 3

CREATE DATABASE Desafio1Lista3

USE Desafio1Lista3

CREATE TABLE Genero (
	cd_Genero INT IDENTITY(1,1),
	ds_Genero VARCHAR(20) NOT NULL,
	abr_Genero CHAR(1) NOT NULL,
	CONSTRAINT pk_Genero PRIMARY KEY(cd_Genero)
)

CREATE TABLE OrgaoEmissorRG (
	cd_OrgaoEmissorRG INT IDENTITY(1,1),
	ds_OrgaoEmissorRG VARCHAR(40) NOT NULL,
	abr_OrgaoEmissorRG VARCHAR(10) NOT NULL,
	CONSTRAINT pk_OrgaoEmissorRG PRIMARY KEY(cd_OrgaoEmissorRG)
)

CREATE TABLE Cargo (
	cd_Cargo INT IDENTITY(1,1),
	ds_Cargo VARCHAR(30) NOT NULL,
	vlr_Salario DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_Cargo PRIMARY KEY(cd_Cargo)
)

CREATE TABLE Departamento (
	cd_Departamento INT IDENTITY(1,1),
	nm_Departamento VARCHAR(40) NOT NULL,
	abr_Departamento VARCHAR(10) NOT NULL,
	cd_FuncionarioGerente INT,
	CONSTRAINT pk_Departamento PRIMARY KEY(cd_Departamento)
)

CREATE TABLE Funcionario (
	cd_Funcionario INT IDENTITY(1,1),
	nm_Funcionario VARCHAR(40) NOT NULL,
	dt_NascFuncionario DATE NOT NULL,
	cd_GeneroFuncionario INT NOT NULL,
	dt_EmissaoRGFuncionario DATE NOT NULL,
	cd_OrgaoEmissor INT NOT NULL,
	nr_RGFuncionario VARCHAR(12) NOT NULL,
	cd_DepartamentoFuncionarioTrabalha INT NOT NULL,
	cd_Cargo INT NOT NULL,
	nr_TelefoneResidencial VARCHAR(15),
	nr_TelefoneCelular VARCHAR(15),
	nr_CPFFuncionario BIGINT NOT NULL,
	CONSTRAINT pk_Funcionario PRIMARY KEY(cd_Funcionario),
	CONSTRAINT fk_Funcionario_Genero FOREIGN KEY (cd_GeneroFuncionario) REFERENCES Genero(cd_Genero),
	CONSTRAINT fk_Funcionario_OrgaoEmissor FOREIGN KEY (cd_OrgaoEmissor) REFERENCES OrgaoEmissorRG(cd_OrgaoEmissorRG),
	CONSTRAINT fk_Funcionario_Departamento FOREIGN KEY (cd_DepartamentoFuncionarioTrabalha) REFERENCES Departamento(cd_Departamento),
	CONSTRAINT fk_Funcionario_Cargo FOREIGN KEY (cd_Cargo) REFERENCES Cargo(cd_Cargo)
);

CREATE TABLE GrauParentesco (
	cd_GrauParentesco INT IDENTITY(1,1),
	ds_GrauParentesco VARCHAR(30) NOT NULL,
	CONSTRAINT pk_GrauParentesco PRIMARY KEY(cd_GrauParentesco)
);

CREATE TABLE FuncionarioDependente (
	cd_Funcionario INT NOT NULL,
	cd_FuncionarioDependente INT NOT NULL,
	dt_NascimentoFuncionarioDependente DATE NOT NULL,
	nr_CPFFuncionarioDependente BIGINT,
	nr_RGFuncionarioDependente VARCHAR(12),
	dt_EmissaoRGFuncionarioDependente DATE,
	cd_OrgaoEmissorFuncionarioDependente INT,
	nm_FuncionarioDependente VARCHAR(40) NOT NULL,
	cd_GeneroDependente INT NOT NULL,
	cd_GrauParentescoDependente INT NOT NULL,
	CONSTRAINT pk_FuncionarioDependente PRIMARY KEY (cd_Funcionario, cd_FuncionarioDependente),
	CONSTRAINT fk_Dependentes_Funcionario FOREIGN KEY (cd_Funcionario) REFERENCES Funcionario(cd_Funcionario),
	CONSTRAINT fk_Dependentes_OrgaoEmissor FOREIGN KEY (cd_OrgaoEmissorFuncionarioDependente) REFERENCES OrgaoEmissorRG(cd_OrgaoEmissorRG),
	CONSTRAINT fk_Dependentes_Genero FOREIGN KEY (cd_GeneroDependente) REFERENCES Genero(cd_Genero),
	CONSTRAINT fk_Dependentes_Parentesco FOREIGN KEY (cd_GrauParentescoDependente) REFERENCES GrauParentesco(cd_GrauParentesco)
);

-- INSERÇÃO NAS TABELAS ----------------------------

INSERT INTO Genero (ds_Genero, abr_Genero) VALUES
('Masculino', 'M'),
('Feminino', 'F'),
('Outro', 'O');

INSERT INTO OrgaoEmissorRG (ds_OrgaoEmissorRG, abr_OrgaoEmissorRG) VALUES
('Secretaria de Segurança Pública', 'SSP'),
('Departamento de Trânsito', 'DETRAN'),
('Instituto de Identificação', 'IIFP');

INSERT INTO Cargo (ds_Cargo, vlr_Salario) VALUES
('Analista de Sistemas', 7500.00),
('Gerente de Projetos', 10500.00),
('Assistente Administrativo', 4500.00);

INSERT INTO Departamento (nm_Departamento, abr_Departamento, cd_FuncionarioGerente) VALUES
('Tecnologia da Informação', 'TI', NULL),
('Recursos Humanos', 'RH', NULL),
('Financeiro', 'FIN', NULL);

INSERT INTO Funcionario (
	nm_Funcionario, dt_NascFuncionario, cd_GeneroFuncionario,
	dt_EmissaoRGFuncionario, cd_OrgaoEmissor, nr_RGFuncionario,
	cd_DepartamentoFuncionarioTrabalha, cd_Cargo,
	nr_TelefoneResidencial, nr_TelefoneCelular, nr_CPFFuncionario
) VALUES
('João Silva', '1990-05-10', 1, '2010-06-01', 1, '123456789', 1, 1, '1122334455', '1199887766', 12345678901),
('Maria Oliveira', '1985-08-15', 2, '2005-03-15', 2, '987654321', 2, 2, NULL, '1199776655', 98765432100),
('Carlos Souza', '1992-12-20', 1, '2012-08-10', 3, '456789123', 3, 3, '1133445566', NULL, 45678912300);

UPDATE Departamento SET cd_FuncionarioGerente = 1 WHERE cd_Departamento = 1;
UPDATE Departamento SET cd_FuncionarioGerente = 2 WHERE cd_Departamento = 2;
UPDATE Departamento SET cd_FuncionarioGerente = 3 WHERE cd_Departamento = 3;

INSERT INTO GrauParentesco (ds_GrauParentesco) VALUES
('Filho(a)'),
('Cônjuge'),
('Pai/Mãe'),
('Irmão/Irmã');

INSERT INTO FuncionarioDependente (
	cd_Funcionario, cd_FuncionarioDependente, dt_NascimentoFuncionarioDependente,
	nr_CPFFuncionarioDependente, nr_RGFuncionarioDependente,
	dt_EmissaoRGFuncionarioDependente, cd_OrgaoEmissorFuncionarioDependente,
	nm_FuncionarioDependente, cd_GeneroDependente, cd_GrauParentescoDependente
) VALUES
(1, 1, '2012-03-25', 32165498700, '112233445', '2020-01-15', 1, 'Lucas Silva', 1, 1),
(2, 1, '2010-07-12', NULL, NULL, NULL, NULL, 'Ana Oliveira', 2, 1),
(3, 1, '1988-09-10', 78945612300, '778899665', '2008-11-01', 2, 'Paula Souza', 2, 2);

SELECT * FROM Funcionario
SELECT * FROM FuncionarioDependente
SELECT * FROM Departamento

-- DESAFIO 2 LISTA 3 ----------------------------------------

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
