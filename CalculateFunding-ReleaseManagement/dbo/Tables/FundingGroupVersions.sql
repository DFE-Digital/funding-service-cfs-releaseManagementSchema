CREATE TABLE [dbo].[FundingGroupVersions] (
    [FundingGroupVersionId]        UNIQUEIDENTIFIER           NOT NULL,
    [FundingGroupId]               UNIQUEIDENTIFIER           NOT NULL,
    [ChannelId]                    INT           NOT NULL,
    [StatusChangedDate]            DATETIME      NOT NULL,
    [MajorVersion]                 INT           NOT NULL,
    [MinorVersion]                 INT           NOT NULL,
    [TemplateVersion]              VARCHAR (64)  NOT NULL,
    [SchemaVersion]                VARCHAR (64)  NOT NULL,
    [JobId]                        VARCHAR (64)  NOT NULL,
    [CorrelationId]                VARCHAR (64)  NOT NULL,
    [FundingPeriodId]              INT           NOT NULL,
    [FundingStreamId]              INT           NOT NULL,
    [FundingId]                    VARCHAR (128) NOT NULL,
    [GroupingReasonId]             INT           NOT NULL,
    [TotalFunding]                 MONEY         NOT NULL,
    [ExternalPublicationDate]      DATETIME      NOT NULL,
    [EarliestPaymentAvailableDate] DATETIME      NOT NULL,
    [ChannelVersion] INT NULL DEFAULT 0, 
    CONSTRAINT [PK_FundingGroupVersions] PRIMARY KEY CLUSTERED ([FundingGroupVersionId] ASC),
    CONSTRAINT [FK_FundingGroupVersions_Channels] FOREIGN KEY ([ChannelId]) REFERENCES [dbo].[Channels] ([ChannelId]),
    CONSTRAINT [FK_FundingGroupVersions_FundingGroups] FOREIGN KEY ([FundingGroupId]) REFERENCES [dbo].[FundingGroups] ([FundingGroupId]),
    CONSTRAINT [FK_FundingGroupVersions_FundingPeriods] FOREIGN KEY ([FundingPeriodId]) REFERENCES [dbo].[FundingPeriods] ([FundingPeriodId]),
    CONSTRAINT [FK_FundingGroupVersions_FundingStreamId] FOREIGN KEY ([FundingStreamId]) REFERENCES [dbo].[FundingStreams] ([FundingStreamId]),
    CONSTRAINT [FK_FundingGroupVersions_GroupingReasons] FOREIGN KEY ([GroupingReasonId]) REFERENCES [dbo].[GroupingReasons] ([GroupingReasonId]), 
    CONSTRAINT [AK_FundingGroupVersions_OneGroupPerChannelAndMajorVersion] UNIQUE ([ChannelId], [FundingGroupId], [MajorVersion])
);






GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersions_FundingGroupId_MajorVersion]
    ON [dbo].[FundingGroupVersions]([FundingGroupId] ASC, [MajorVersion] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersions_ExternalApi]
    ON [dbo].[FundingGroupVersions]([StatusChangedDate] ASC, [ChannelId] ASC, [FundingPeriodId] ASC, [FundingStreamId] ASC, [GroupingReasonId] ASC, [FundingId] ASC);






GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersions_StatusChangedDate]
    ON [dbo].[FundingGroupVersions]([StatusChangedDate] DESC, [ChannelId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersions_ExternalApiSlim]
    ON [dbo].[FundingGroupVersions]([ChannelId] ASC, [FundingStreamId] ASC, [StatusChangedDate] DESC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For migration lookup', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FundingGroupVersions', @level2type = N'INDEX', @level2name = N'IX_FundingGroupVersions_FundingGroupId_MajorVersion';


GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersions_LatestFundingGroupsByStatusDate]
    ON [dbo].[FundingGroupVersions]([FundingGroupId] ASC, [StatusChangedDate] DESC, [MajorVersion] ASC, [FundingId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersions_LatestAscOrderByChannelAndStatusDate]
    ON [dbo].[FundingGroupVersions]([ChannelId] ASC)
    INCLUDE([FundingGroupId], [StatusChangedDate], [MajorVersion], [FundingId]);


GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersions_Feed_ChannelIdFundingPeriodId]
    ON [dbo].[FundingGroupVersions]([ChannelId] ASC)
    INCLUDE([StatusChangedDate], [MajorVersion], [FundingPeriodId], [FundingId]);


GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersions_Feed_ChannelId_FundingPeriodId]
    ON [dbo].[FundingGroupVersions]([ChannelId] ASC, [FundingPeriodId] ASC)
    INCLUDE([StatusChangedDate], [MajorVersion], [FundingId]);

