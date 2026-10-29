CREATE TABLE [dbo].[VariationPointers]
(
	[ProfileVariationPointerId] INT IDENTITY(1,1), 
    [SpecificationVersionId] VARCHAR(512) NOT NULL, 
    [FundingLineId] NVARCHAR(50) NOT NULL, 
    [PeriodType] NVARCHAR(50) NOT NULL, 
    [PeriodValue] NVARCHAR(50) NOT NULL, 
    [Year] INT NOT NULL, 
    [Occurrence] INT NOT NULL, 
    [IsDeleted] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_VariationPointers] PRIMARY KEY ([ProfileVariationPointerId]), 
    CONSTRAINT [FK_VariationPointers_SpecificationVersions] FOREIGN KEY ([SpecificationVersionId]) REFERENCES [SpecificationVersions]([SpecificationVersionId])
    
)

GO

CREATE INDEX [IX_VariationPointers_SpecificationId_IsDeleted] ON [dbo].[VariationPointers] ([SpecificationVersionId],[IsDeleted])
