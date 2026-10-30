

CREATE PROCEDURE [dbo].[DeleteChannelSpecificRelease]
(
    @SpecificationId NVARCHAR(250), 
	@CorrelationId NVARCHAR(250)
)
AS
BEGIN

DECLARE @FundingGroupVersionIds TABLE
(
    FundingGroupVersionId UNIQUEIDENTIFIER,
	FundingGroupId UNIQUEIDENTIFIER
)

INSERT INTO @FundingGroupVersionIds
SELECT FundingGroupVersionId, FundingGroupId FROM FundingGroupVersions where CorrelationId = @CorrelationId
--1. Select from FundingGroups and FundingGroupVersion--
SELECT * FROM @FundingGroupVersionIds

DECLARE @FundingGroupProviderIds TABLE
(
    FundingGroupProviderId UNIQUEIDENTIFIER,
	FundingGroupVersionId UNIQUEIDENTIFIER,
	ReleasedProviderVersionChannelId UNIQUEIDENTIFIER
)

INSERT INTO @FundingGroupProviderIds
SELECT FundingGroupProviderId, FundingGroupVersionId, ReleasedProviderVersionChannelId FROM FundingGroupProviders WHERE FundingGroupVersionId IN (SELECT FundingGroupVersionId FROM @FundingGroupVersionIds)

--2. Select from FundingGroupProviders--
SELECT * FROM @FundingGroupProviderIds

DECLARE @ReleasedProviderVersionChannelIds TABLE
(
    ReleasedProviderVersionId UNIQUEIDENTIFIER,
	ReleasedProviderVersionChannelId UNIQUEIDENTIFIER
)

INSERT INTO @ReleasedProviderVersionChannelIds
SELECT ReleasedProviderVersionId, ReleasedProviderVersionChannelId FROM ReleasedProviderVersionChannels WHERE ReleasedProviderVersionChannelId IN (SELECT ReleasedProviderVersionChannelId FROM @FundingGroupProviderIds)

--3. Select from ReleasedProviderVersionChannels--
SELECT * FROM @ReleasedProviderVersionChannelIds

DECLARE @ReleasedProviderVersionIds TABLE
(
    ReleasedProviderVersionId UNIQUEIDENTIFIER,
	ReleasedProviderId UNIQUEIDENTIFIER
)

INSERT INTO @ReleasedProviderVersionIds
SELECT ReleasedProviderVersionId, ReleasedProviderId FROM ReleasedProviderVersions WHERE ReleasedProviderVersionId IN (SELECT ReleasedProviderVersionId FROM @ReleasedProviderVersionChannelIds)

--4. Select from ReleasedProviderVersions--
SELECT * FROM @ReleasedProviderVersionIds

DECLARE @ReleasedProviderIds TABLE
(
    ReleasedProviderId UNIQUEIDENTIFIER,
	SpecificationId UNIQUEIDENTIFIER
)

INSERT INTO @ReleasedProviderIds
SELECT ReleasedProviderId, SpecificationId FROM ReleasedProviders WHERE ReleasedProviderId IN (SELECT ReleasedProviderId FROM @ReleasedProviderVersionIds)

--5. Select from ReleasedProvider--
SELECT * FROM @ReleasedProviderIds

--6. Select from ReleasedProviderChannelVariationReasons--
SELECT * FROM ReleasedProviderChannelVariationReasons WHERE ReleasedProviderVersionChannelId IN (SELECT ReleasedProviderVersionChannelId FROM @ReleasedProviderVersionChannelIds)

--7. Select from FundingGroupVersionVariationReason--
SELECT * FROM FundingGroupVersionVariationReasons WHERE FundingGroupVersionId IN (SELECT FundingGroupVersionId FROM @FundingGroupVersionIds)

--8. Select from FundingGroups--
SELECT * FROM FundingGroups WHERE FundingGroupId IN (SELECT FundingGroupId FROM @FundingGroupVersionIds)

--1. FundingGroupVersionVariationReasons
DELETE FROM FundingGroupVersionVariationReasons WHERE FundingGroupVersionId IN (SELECT FundingGroupVersionId FROM @FundingGroupVersionIds)
--2. ReleasedProviderChannelVariationReasons
DELETE FROM ReleasedProviderChannelVariationReasons WHERE ReleasedProviderVersionChannelId IN (SELECT ReleasedProviderVersionChannelId FROM @ReleasedProviderVersionChannelIds)
--3. ReleasedProviderVersionChannels
DELETE FROM ReleasedProviderVersionChannels WHERE ReleasedProviderVersionChannelId IN (SELECT ReleasedProviderVersionChannelId FROM @ReleasedProviderVersionChannelIds)
--4. FundingGroupVersions
DELETE FROM FundingGroupVersions WHERE FundingGroupVersionId IN (SELECT FundingGroupVersionId FROM @FundingGroupVersionIds)
--5. ReleasedProviderVersions
DELETE FROM ReleasedProviderVersions WHERE ReleasedProviderVersionId IN (SELECT ReleasedProviderVersionId FROM @ReleasedProviderVersionIds)
--6. FundingGroups
DELETE FROM FundingGroups WHERE FundingGroupId IN (SELECT FundingGroupId FROM @FundingGroupVersionIds)
--7. ReleasedProviders
DELETE FROM ReleasedProviders WHERE ReleasedProviderId IN (SELECT ReleasedProviderId FROM @ReleasedProviderIds)
--8. FundingGroupProviders
DELETE FROM FundingGroupProviders WHERE FundingGroupProviderId IN (SELECT FundingGroupProviderId FROM @FundingGroupProviderIds)

END
