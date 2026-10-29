CREATE TABLE [dbo].[VariationReasons] (
    [VariationReasonId]   INT           NOT NULL,
    [VariationReasonName] VARCHAR (128) NOT NULL,
    [VariationReasonCode] VARCHAR (64)  NOT NULL,
    CONSTRAINT [PK_VariationReasons] PRIMARY KEY CLUSTERED ([VariationReasonId] ASC)
);

