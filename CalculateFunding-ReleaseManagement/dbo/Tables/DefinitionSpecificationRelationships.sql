CREATE TABLE [dbo].[DefinitionSpecificationRelationships]
(  
    [Id] INT IDENTITY(1,1),
	[DataDefinitionRelationshipId] NVARCHAR(255) NOT NULL,
    [SpecificationVersionId] VARCHAR(512) NOT NULL, 
    [IsDeleted] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [FK_DefinitionSpecificationRelationships_SpecificationVersions] FOREIGN KEY ([SpecificationVersionId]) REFERENCES [SpecificationVersions]([SpecificationVersionId]), 
    CONSTRAINT [PK_DefinitionSpecificationRelationships] PRIMARY KEY ([Id]) 
)
