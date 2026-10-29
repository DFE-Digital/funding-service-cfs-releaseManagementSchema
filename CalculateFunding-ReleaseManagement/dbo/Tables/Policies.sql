CREATE TABLE [dbo].[Policies]
(
	[Id]          	               INT PRIMARY KEY IDENTITY(1,1), 
	[PolicyId]          	       NVARCHAR(50)  NOT NULL, 
    [DocumentType]                 NVARCHAR(50)  NOT NULL, 
    [Content]                      NVARCHAR(MAX) NOT NULL,
    [FundingPeriodId]              INT           NOT NULL,
    [FundingStreamId]              INT           NOT NULL,
    [CreatedAt]                    DATETIME2     NOT NULL, 
    [UpdatedAt]                    DATETIME2     NOT NULL, 
    [IsDeleted]                    BIT           NOT NULL DEFAULT 0, 
)
