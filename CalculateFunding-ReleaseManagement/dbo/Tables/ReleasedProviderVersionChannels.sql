CREATE TABLE [dbo].[ReleasedProviderVersionChannels] (
    [ReleasedProviderVersionChannelId] UNIQUEIDENTIFIER              NOT NULL,
    [ReleasedProviderVersionId]        UNIQUEIDENTIFIER            NOT NULL,
    [ChannelId]                        INT            NOT NULL,
    [StatusChangedDate]                DATETIME       NOT NULL,
    [AuthorId]                         VARCHAR (64)   NOT NULL,
    [AuthorName]                       NVARCHAR (512) NOT NULL,
    [ChannelVersion]                   INT            NULL DEFAULT 0, 
    CONSTRAINT [PK_ProviderFundingVersionChannels] PRIMARY KEY CLUSTERED ([ReleasedProviderVersionChannelId] ASC),
    CONSTRAINT [FK_ProviderFundingVersionChannels_Channels] FOREIGN KEY ([ChannelId]) REFERENCES [dbo].[Channels] ([ChannelId]),
    CONSTRAINT [FK_ProviderFundingVersionChannels_ProviderFundingVersions] FOREIGN KEY ([ReleasedProviderVersionId]) REFERENCES [dbo].[ReleasedProviderVersions] ([ReleasedProviderVersionId]), 
    CONSTRAINT [AK_ReleasedProviderVersionChannels_ReleaseProviderVersionId_ChannelId] UNIQUE ([ReleasedProviderVersionId], [ChannelId])
);
