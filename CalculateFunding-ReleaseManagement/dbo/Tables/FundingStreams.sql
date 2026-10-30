CREATE TABLE [dbo].[FundingStreams] (
    [FundingStreamId]   INT            IDENTITY (1, 1) NOT NULL,
    [FundingStreamCode] VARCHAR (16)   NOT NULL,
    [FundingStreamName] NVARCHAR (256) NOT NULL,
    [ShortFundingStreamName] NVARCHAR (256) NULL,
    CONSTRAINT [PK_FundingStreamId] PRIMARY KEY CLUSTERED ([FundingStreamId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FundingStreams_FundingStreamCode]
    ON [dbo].[FundingStreams]([FundingStreamCode] ASC);

