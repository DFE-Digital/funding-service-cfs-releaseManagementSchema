CREATE TABLE [dbo].[Datasets]
(
	[DatasetId] NVARCHAR(255) NOT NULL,
    [Name] NVARCHAR(255) NULL, 
    [DefinitionId] NVARCHAR(255) NULL,
    [DefinitionName] NVARCHAR(255) NULL,
    [DefinitionVersion] INT NULL,
    [DatasetSpecificationRelationshipId] NVARCHAR(255) NULL, 
    [CreatedAt] DATETIME2 NOT NULL, 
    [UpdatedAt] DATETIME2 NOT NULL, 
    [IsDeleted] BIT NOT NULL DEFAULT 0,
    CONSTRAINT [PK_DatasetId] PRIMARY KEY ([DatasetId]), 
    )
