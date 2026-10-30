CREATE TABLE [dbo].[Channels] (
    [ChannelId]   INT          IDENTITY (1, 1) NOT NULL,
    [ChannelName] VARCHAR (64) NOT NULL,
    [UrlKey]      VARCHAR (32) NOT NULL,
    [ChannelCode] VARCHAR (32) NOT NULL,
    CONSTRAINT [PK_Channels] PRIMARY KEY CLUSTERED ([ChannelId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Channels_ChannelCode]
    ON [dbo].[Channels]([ChannelCode] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Channels_UrlKey]
    ON [dbo].[Channels]([UrlKey] ASC);

