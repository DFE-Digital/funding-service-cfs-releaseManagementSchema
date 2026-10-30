CREATE TABLE [dbo].[FundingGroupProviders] (
    [FundingGroupProviderId]           UNIQUEIDENTIFIER NOT NULL,
    [FundingGroupVersionId]            UNIQUEIDENTIFIER NOT NULL,
    [ReleasedProviderVersionChannelId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_FundingGroupProviders] PRIMARY KEY CLUSTERED ([FundingGroupProviderId] ASC),
    CONSTRAINT [FK_FundingGroupProviders_FundingGroupVersions] FOREIGN KEY ([FundingGroupVersionId]) REFERENCES [dbo].[FundingGroupVersions] ([FundingGroupVersionId]),
    CONSTRAINT [FK_FundingGroupProviders_ReleasedProviderVersionChannels] FOREIGN KEY ([ReleasedProviderVersionChannelId]) REFERENCES [dbo].[ReleasedProviderVersionChannels] ([ReleasedProviderVersionChannelId])
);







