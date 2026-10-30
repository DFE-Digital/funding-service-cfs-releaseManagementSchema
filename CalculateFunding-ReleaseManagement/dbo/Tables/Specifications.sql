CREATE TABLE [dbo].[Specifications] (
    [SpecificationId]   VARCHAR (64)   NOT NULL,
    [SpecificationName] NVARCHAR (256) NOT NULL,
    [FundingStreamId]   INT            NOT NULL,
    [FundingPeriodId]   INT            NOT NULL ,
    [IsSelectedForFunding] BIT NOT NULL DEFAULT 0, 
    [ForceUpdateOnNextRefresh] BIT NOT NULL DEFAULT 0, 
    [IsDeleted] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_Specifications] PRIMARY KEY CLUSTERED ([SpecificationId] ASC),
    CONSTRAINT [FK_Specifications_FundingPeriods] FOREIGN KEY ([FundingPeriodId]) REFERENCES [FundingPeriods]([FundingPeriodId]), 
    CONSTRAINT [FK_Specifications_FundingStreams] FOREIGN KEY ([FundingStreamId]) REFERENCES [FundingStreams]([FundingStreamId])
);


GO
CREATE NONCLUSTERED INDEX [IX_Specifications_FundingPeriodId]
    ON [dbo].[Specifications]([FundingPeriodId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Specifications_FundingStreamId]
    ON [dbo].[Specifications]([FundingStreamId] ASC);

