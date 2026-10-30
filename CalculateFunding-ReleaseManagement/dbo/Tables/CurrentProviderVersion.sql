CREATE TABLE [dbo].[CurrentProviderVersion] (
    [CurrentProviderVersionId] NVARCHAR(50) NOT NULL,
    [ProviderVersionId] NVARCHAR(50) NOT NULL,
    [ProviderSnapshotId] INT NOT NULL,
    [CreatedAt] DATETIME2 NOT NULL,
    [UpdatedAt] DATETIME2 NOT NULL,
     [IsDeleted] BIT NOT NULL DEFAULT 0,
    CONSTRAINT [PK_CurrentProviderVersion] PRIMARY KEY ([CurrentProviderVersionId])
);