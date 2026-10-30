CREATE TABLE [dbo].[ProviderSourceDatasetVersions]
(
	[ProviderSourceDatasetVersionId] NVARCHAR(255) NOT NULL, 
    [ProviderSourceDatasetId] NVARCHAR(255) NOT NULL, 
    [DatasetId] NVARCHAR(255) NULL, 
    [DatasetVersion] INT NOT NULL, 
    [ProviderSourceDatasetRowData] NVARCHAR(MAX) NOT NULL, 
    [Version] INT NOT NULL, 
    [AuthorId] NVARCHAR(256) NOT NULL, 
    [AuthorName] NVARCHAR(50) NOT NULL, 
    [Comment] NVARCHAR(255) NULL, 
    [PublishStatus] NVARCHAR(50) NOT NULL, 
    [CreatedAt] DATETIME2 NOT NULL, 
    [UpdatedAt] DATETIME2 NOT NULL, 
    [Date] DATETIME2 NOT NULL, 
    [IsDeleted] BIT NOT NULL DEFAULT 0, 
    [IsLatest] BIT NOT NULL DEFAULT 0,
    CONSTRAINT [PK_ProviderSourceDatasetVersionId] PRIMARY KEY ([ProviderSourceDatasetVersionId]), 
    CONSTRAINT [FK_ProviderSourceDatasetVersions_ProviderSourceDataset] FOREIGN KEY ([ProviderSourceDatasetId]) REFERENCES [ProviderSourceDatasets]([ProviderSourceDatasetId]),
    CONSTRAINT [FK_ProviderSourceDatasetVersions_Datasets] FOREIGN KEY ([DatasetId]) REFERENCES [Datasets]([DatasetId])
)
