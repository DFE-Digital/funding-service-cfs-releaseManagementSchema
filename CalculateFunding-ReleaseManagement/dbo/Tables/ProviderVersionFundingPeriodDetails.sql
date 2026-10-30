CREATE TABLE [dbo].[ProviderVersionFundingPeriodDetails] (
    [ProviderVersionFundingPeriodDetailsId] INT IDENTITY(1,1) NOT NULL,
    [CurrentProviderVersionId] NVARCHAR(50) NOT NULL,
    [FundingPeriodId] INT NOT NULL,
    [ProviderSnapshotId] INT NOT NULL,
    [ProviderVersionId] NVARCHAR(50) NOT NULL,
    CONSTRAINT [PK_ProviderVersionFundingPeriodDetails] PRIMARY KEY ([ProviderVersionFundingPeriodDetailsId]),

    CONSTRAINT [FK_ProviderVersionFundingPeriodDetails_CurrentProviderVersion] FOREIGN KEY ([CurrentProviderVersionId]) 
        REFERENCES [dbo].[CurrentProviderVersion] ([CurrentProviderVersionId]),

    CONSTRAINT [FK_ProviderVersionFundingPeriodDetails_FundingPeriodId] FOREIGN KEY ([FundingPeriodId]) 
        REFERENCES [dbo].[FundingPeriods]([FundingPeriodId])
);