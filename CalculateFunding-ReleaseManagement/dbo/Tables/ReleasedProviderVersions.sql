CREATE TABLE [dbo].[ReleasedProviderVersions] (
    [ReleasedProviderVersionId] UNIQUEIDENTIFIER           NOT NULL,
    [ReleasedProviderId]        UNIQUEIDENTIFIER           NOT NULL,
    [MajorVersion]              INT           NOT NULL,
    [MinorVersion]              INT           NOT NULL,
    [FundingId]                 VARCHAR (128) NOT NULL,
    [TotalFunding] DECIMAL(16, 2) NOT NULL, 
    [CoreProviderVersionId] VARCHAR(128) NOT NULL, 
    CONSTRAINT [PK_ProviderFundingVersions] PRIMARY KEY CLUSTERED ([ReleasedProviderVersionId] ASC),
    CONSTRAINT [FK_ProviderFundingVersions_ProviderFundings1] FOREIGN KEY ([ReleasedProviderId]) REFERENCES [dbo].[ReleasedProviders] ([ReleasedProviderId]), 
    CONSTRAINT [AK_ReleasedProviderVersions_ReleasedProviderMajorVersion] UNIQUE ([ReleasedProviderId], [MajorVersion])
);




GO

CREATE INDEX [IX_ReleasedProviderVersions_ReleasedProviderId] ON [dbo].[ReleasedProviderVersions] ([ReleasedProviderId])

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Providers service identifier for snapshot of core provider data',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'ReleasedProviderVersions',
    @level2type = N'COLUMN',
    @level2name = N'CoreProviderVersionId'