CREATE TABLE [dbo].[TemplatePredecessors]
(
    [PredecessorId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [TemplateId] UNIQUEIDENTIFIER NOT NULL, 
    [TemplateVersionId] NVARCHAR(512) NOT NULL,
    
    CONSTRAINT [FK_TemplatePredecessors_Templates] FOREIGN KEY ([TemplateId]) REFERENCES [dbo].[Templates] ([TemplateId]),
    CONSTRAINT [FK_TemplatePredecessors_TemplateVersions] FOREIGN KEY ([TemplateVersionId]) REFERENCES [dbo].[TemplateVersions] ([TemplateVersionId])
)
