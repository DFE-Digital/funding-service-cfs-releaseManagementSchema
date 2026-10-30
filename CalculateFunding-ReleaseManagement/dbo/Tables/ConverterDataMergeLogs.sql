CREATE TABLE [dbo].[ConverterDataMergeLogs]
(
	[Id] NVARCHAR(255) NOT NULL, 
    [ContentJson] NVARCHAR(MAX) NOT NULL, 
    [CreatedAt] DATETIME2 NOT NULL, 
    [UpdatedAt] DATETIME2 NOT NULL, 
    [IsDeleted] BIT NOT NULL DEFAULT 0,
    [ParentJobId] NVARCHAR(255) NULL,
    CONSTRAINT [PK_Id] PRIMARY KEY CLUSTERED([Id] ASC),
);
GO

CREATE INDEX [ConverterDataMergeLogs_ParentJobId] ON [dbo].[ConverterDataMergeLogs] ([ParentJobId])

