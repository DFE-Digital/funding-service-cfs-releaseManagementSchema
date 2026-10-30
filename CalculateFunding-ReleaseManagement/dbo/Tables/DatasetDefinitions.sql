CREATE TABLE [dbo].[DatasetDefinitions]
(
	[Id] NVARCHAR(64) NOT NULL,
	[Name] NVARCHAR(255) NOT NULL,
	[Version] INT NOT NULL, 
	[Description] NVARCHAR(MAX) NULL,
	[FundingStreamId] INT NOT NULL,
	[ConverterEligible] BIT NOT NULL DEFAULT 0,
	[ValidateProviders] BIT NOT NULL DEFAULT 0,
	[ValidateProvidersByYearRange] INT NULL DEFAULT 0,
	[TableDefinitions] NVARCHAR(MAX) NOT NULL,
	[CreatedAt] DATETIME2 NOT NULL, 
	[UpdatedAt] DATETIME2 NOT NULL, 
	[IsDeleted] BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_DatasetDefinitionId] PRIMARY KEY ([Id]), 
	CONSTRAINT [FK_DatasetDefinitions_FundingStreams] FOREIGN KEY ([FundingStreamId]) REFERENCES [FundingStreams]([FundingStreamId])
)