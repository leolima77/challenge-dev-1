CREATE DATABASE WappaChallenge
Go

use WappaChallenge
Go

CREATE TABLE dbo.Motorista
	(
	IdMotorista bigint NOT NULL IDENTITY (1, 1),
	Nome varchar(80) NULL,
	Sobrenome varchar(100) NULL,
	DataInclusao datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Motorista ADD CONSTRAINT
	PK_Motorista PRIMARY KEY CLUSTERED 
	(
	IdMotorista
	) ON [PRIMARY]

GO

CREATE TABLE dbo.Endereco
	(
	IdEndereco bigint NOT NULL IDENTITY (1, 1),
	IdMotorista bigint NOT NULL,
	Logradouro varchar(200) NULL,
	Numero varchar(20) NULL,
	Bairro varchar(120) NULL,
	Complemento varchar(160) NULL,
	Cidade varchar(100) NULL,
	Estado varchar(2) NULL,
	Cep varchar(9) NULL,
	Latitude varchar(20) NULL,
	Longitude varchar(20) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Endereco ADD CONSTRAINT
	PK_Endereco1 PRIMARY KEY CLUSTERED 
	(
	IdEndereco
	) ON [PRIMARY]

GO
ALTER TABLE dbo.Endereco ADD CONSTRAINT
	FK_Endereco_Motorista1 FOREIGN KEY
	(
	IdMotorista
	) REFERENCES dbo.Motorista
	(
	IdMotorista
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO

CREATE TABLE dbo.Carro
	(
	IdCarro bigint NOT NULL IDENTITY (1, 1),
	IdMotorista bigint NOT NULL,
	Marca varchar(60) NULL,
	Modelo varchar(80) NULL,
	Placa varchar(8) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Carro ADD CONSTRAINT
	PK_Carro PRIMARY KEY CLUSTERED 
	(
	IdCarro
	)  ON [PRIMARY]

GO
ALTER TABLE dbo.Carro ADD CONSTRAINT
	FK_Carro_Motorista FOREIGN KEY
	(
	IdMotorista
	) REFERENCES dbo.Motorista
	(
	IdMotorista
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO

CREATE TABLE [dbo].[Auditoria](
	[idAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[Tabela] [varchar](50) NOT NULL,
	[ChavesPrimarias] [varchar](500) NULL,
	[ValorAntigo] [text] NULL,
	[ValorNovo] [text] NULL
 CONSTRAINT [PK_Auditoria] PRIMARY KEY CLUSTERED 
(
	[idAuditoria] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


