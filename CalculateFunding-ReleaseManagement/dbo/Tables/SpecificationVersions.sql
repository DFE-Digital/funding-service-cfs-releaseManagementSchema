CREATE TABLE [dbo].[SpecificationVersions]
(
	[SpecificationVersionId] VARCHAR(512) NOT NULL, 
    [SpecificationId] VARCHAR(64) NOT NULL, 
    [SpecificationName] NVARCHAR(512) NOT NULL,
    [ProviderVersionId] NVARCHAR(255) NULL, 
    [TemplateVersion] DECIMAL(18, 1) NULL, 
    [Version] INT NOT NULL, 
    [Description] NVARCHAR(MAX) NULL,
    [ExternalPublicationDate] DATETIME2 NULL, 
    [EarliestPaymentAvailableDate] DATETIME2 NULL, 
    [ProviderSource] NVARCHAR(50) NULL, 
    [ProviderSnapshotId] INT NULL, 
    [CoreProviderVersionUpdates] NVARCHAR(50) NOT NULL,
    [Date] DATETIME2 NOT NULL, 
    [AuthorId] NVARCHAR(256) NOT NULL, 
    [AuthorName] NVARCHAR(512) NOT NULL, 
    [Comment] NVARCHAR(MAX) NULL, 
    [PublishStatus] NVARCHAR(50) NOT NULL, 
    [CreatedAt] DATETIME2 NOT NULL, 
    [UpdatedAt] DATETIME2 NOT NULL, 
    [IsDeleted] BIT NOT NULL DEFAULT 0, 
    [IsLatest] BIT NOT NULL DEFAULT 0,
    CONSTRAINT [PK_SpecificationVersions] PRIMARY KEY ([SpecificationVersionId]), 
    CONSTRAINT [FK_SpecificationVersions_Specifications] FOREIGN KEY ([SpecificationId]) REFERENCES [Specifications]([SpecificationId])
)

GO

CREATE INDEX [IX_SpecificationVersions_SpecificationId_IsDeleted] ON [dbo].[SpecificationVersions] ([SpecificationId],[IsDeleted])
