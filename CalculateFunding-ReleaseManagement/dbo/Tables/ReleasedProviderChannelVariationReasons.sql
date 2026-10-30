CREATE TABLE [dbo].[ReleasedProviderChannelVariationReasons] (
    [ReleasedProviderChannelVariationReasonId] UNIQUEIDENTIFIER NOT NULL,
    [VariationReasonId]                        INT NOT NULL,
    [ReleasedProviderVersionChannelId]         UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_ReleasedProviderChannelVariationReasons] PRIMARY KEY CLUSTERED ([ReleasedProviderChannelVariationReasonId] ASC),
    CONSTRAINT [FK_ReleasedProviderChannelVariationReasons_ReleasedProviderVersionChannels] FOREIGN KEY ([ReleasedProviderChannelVariationReasonId]) REFERENCES [dbo].[ReleasedProviderVersionChannels] ([ReleasedProviderVersionChannelId]),
    CONSTRAINT [FK_ReleasedProviderChannelVariationReasons_VariationReasons] FOREIGN KEY ([VariationReasonId]) REFERENCES [dbo].[VariationReasons] ([VariationReasonId])
);


GO

CREATE INDEX [IX_ReleasedProviderChannelVariationReasons_ReleasedProviderVersionChannelId] ON [dbo].[ReleasedProviderChannelVariationReasons] ([ReleasedProviderVersionChannelId])
