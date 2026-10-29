CREATE TABLE [dbo].[ReleasedProviders] (
    [ReleasedProviderId] UNIQUEIDENTIFIER          NOT NULL,
    [SpecificationId]    VARCHAR (64) NOT NULL,
    [ProviderId]         VARCHAR (32) NOT NULL,
    CONSTRAINT [PK_ProviderFundings] PRIMARY KEY CLUSTERED ([ReleasedProviderId] ASC),
    CONSTRAINT [FK_ProviderFundings_Specifications] FOREIGN KEY ([SpecificationId]) REFERENCES [dbo].[Specifications] ([SpecificationId]), 
    CONSTRAINT [AK_ReleasedProviders_ProviderId_SpecificationId] UNIQUE ([SpecificationId], [ProviderId])
);


GO

CREATE INDEX [IX_ReleasedProviders_SpecificationId] ON [dbo].[ReleasedProviders] ([SpecificationId])

GO

CREATE INDEX [IX_ReleasedProviders_ProviderId] ON [dbo].[ReleasedProviders] ([ProviderId])
