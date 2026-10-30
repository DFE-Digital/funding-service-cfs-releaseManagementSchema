CREATE TABLE [dbo].[FundingGroups] (
    [FundingGroupId]                      UNIQUEIDENTIFIER NOT NULL,
    [SpecificationId]                     VARCHAR (64)   NOT NULL,
    [ChannelId]                           INT            NOT NULL,
    [OrganisationGroupTypeCode]           VARCHAR (128)  NOT NULL,
    [OrganisationGroupTypeIdentifier]     VARCHAR (128)  NOT NULL,
    [OrganisationGroupIdentifierValue]    VARCHAR (128)  NOT NULL,
    [OrganisationGroupName]               NVARCHAR (256) NOT NULL,
    [OrganisationGroupSearchableName]     NVARCHAR (256) NOT NULL,
    [OrganisationGroupTypeClassification] VARCHAR (128)  NOT NULL,
    [GroupingReasonId]                    INT            NOT NULL,
    CONSTRAINT [PK_FundingGroups] PRIMARY KEY CLUSTERED ([FundingGroupId] ASC),
    CONSTRAINT [FK_FundingGroups_GroupingReasons] FOREIGN KEY ([GroupingReasonId]) REFERENCES [dbo].[GroupingReasons] ([GroupingReasonId]),
    CONSTRAINT [FK_FundingGroups_Specifications] FOREIGN KEY ([SpecificationId]) REFERENCES [dbo].[Specifications] ([SpecificationId]), 
    CONSTRAINT [AK_FundingGroups_uniqueGroup] UNIQUE ([SpecificationId], [ChannelId], [GroupingReasonId], [OrganisationGroupIdentifierValue], [OrganisationGroupTypeCode])
);


GO
CREATE NONCLUSTERED INDEX [IX_FundingGroups_FindSingleExisting]
    ON [dbo].[FundingGroups]([ChannelId] ASC, [SpecificationId] ASC, [OrganisationGroupTypeClassification] ASC, [OrganisationGroupIdentifierValue] ASC);

