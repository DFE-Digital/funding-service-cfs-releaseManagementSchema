CREATE TABLE [dbo].[ProviderSourceDatasets]
(
	[ProviderSourceDatasetId] NVARCHAR(255) NOT NULL, 
    [ProviderId] NVARCHAR(32) NOT NULL, 
    [SpecificationId] VARCHAR(64) NOT NULL, 
    [DataDefinitionId] NVARCHAR(255) NOT NULL, 
    [DatasetRelationshipSummaryId] NVARCHAR(255) NOT NULL, 
    [DataRelationshipSummaryName] NVARCHAR(64) NOT NULL, 
    [DataGranularity] NVARCHAR(32) NOT NULL, 
    [DefinesScope] BIT NULL DEFAULT 0, 
    [IsDeleted] BIT NOT NULL DEFAULT 0,
    [DatasetRelationshipType] NVARCHAR(50) NULL, 
    CONSTRAINT [PK_ProviderSourceDatasetId] PRIMARY KEY ([ProviderSourceDatasetId]), 
    CONSTRAINT [FK_ProviderSourceDatasets_Specifications] FOREIGN KEY ([SpecificationId]) REFERENCES [Specifications]([SpecificationId])
)
