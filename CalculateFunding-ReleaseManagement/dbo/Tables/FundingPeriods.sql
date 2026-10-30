CREATE TABLE [dbo].[FundingPeriods] (
    [FundingPeriodId]   INT            IDENTITY (1, 1) NOT NULL,
    [FundingPeriodCode] VARCHAR (64)   NOT NULL,
    [FundingPeriodName] NVARCHAR (128) NOT NULL,
    [StartDate] DATETIME NULL, 
    [EndDate] DATETIME NULL, 
    [Period] VARCHAR (64)   NULL,
    [Type] VARCHAR (64)   NULL,
    [StartYear] INT NULL, 
    [EndYear] INT NULL, 
    CONSTRAINT [PK_FundingPeriods] PRIMARY KEY CLUSTERED ([FundingPeriodId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FundingPeriods_FundingPeriodCode]
    ON [dbo].[FundingPeriods]([FundingPeriodCode] ASC);

