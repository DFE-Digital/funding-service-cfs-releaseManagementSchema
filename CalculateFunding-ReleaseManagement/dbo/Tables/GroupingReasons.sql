CREATE TABLE [dbo].[GroupingReasons] (
    [GroupingReasonId]   INT          NOT NULL,
    [GroupingReasonName] VARCHAR (64) NOT NULL,
    [GroupingReasonCode] VARCHAR (32) NOT NULL,
    CONSTRAINT [PK_GroupingReasons] PRIMARY KEY CLUSTERED ([GroupingReasonId] ASC)
);

