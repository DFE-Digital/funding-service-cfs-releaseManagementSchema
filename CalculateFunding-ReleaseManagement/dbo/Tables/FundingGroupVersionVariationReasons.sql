CREATE TABLE [dbo].[FundingGroupVersionVariationReasons] (
    [FundingGroupVersionVariationReasonId] UNIQUEIDENTIFIER NOT NULL,
    [FundingGroupVersionId]                UNIQUEIDENTIFIER NOT NULL,
    [VariationReasonId]                    INT NOT NULL,
    CONSTRAINT [PK_FundingGroupVersionVariationReasons] PRIMARY KEY CLUSTERED ([FundingGroupVersionVariationReasonId] ASC),
    CONSTRAINT [FK_FundingGroupVersionVariationReasons_FundingGroupVersions] FOREIGN KEY ([FundingGroupVersionId]) REFERENCES [dbo].[FundingGroupVersions] ([FundingGroupVersionId]),
    CONSTRAINT [FK_FundingGroupVersionVariationReasons_VariationReasons] FOREIGN KEY ([VariationReasonId]) REFERENCES [dbo].[VariationReasons] ([VariationReasonId])
);


GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersionVariationReasons_FundingGroupVersionId]
    ON [dbo].[FundingGroupVersionVariationReasons]([FundingGroupVersionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersionVariationReasons_VariationReason]
    ON [dbo].[FundingGroupVersionVariationReasons]([VariationReasonId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FundingGroupVersionVariationReasons_VariationAndFundingGroupId]
    ON [dbo].[FundingGroupVersionVariationReasons]([FundingGroupVersionId] ASC, [VariationReasonId] ASC);

