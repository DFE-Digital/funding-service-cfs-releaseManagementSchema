SELECT Versions.FundingId FROM 
[ReleaseManagement].[dbo].[FundingGroupVersions] AS Versions 

INNER JOIN (

SELECT
FundingGroupId,
Max(MajorVersion) As MajorVersion
      
  FROM [ReleaseManagement].[dbo].[FundingGroupVersions] AS LatestVersions
  GROUP BY LatestVersions.FundingGroupId, LatestVersions.MajorVersion
  ) LV ON Versions.FundingGroupId = LV.FundingGroupId AND  Versions.MajorVersion = LV.MajorVersion 

  WHERE Versions.ChannelId = 1