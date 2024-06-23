CREATE PARTITION FUNCTION ImpressionDatesPF (DATETIME)
AS RANGE RIGHT FOR VALUES ('20200101', '20210101', '20220101', '20230101');
GO

CREATE PARTITION SCHEME ImpressionDatesPS
AS PARTITION ImpressionDatesPF
ALL TO ([PRIMARY]) ;
GO

CREATE TABLE dbo.ImpressionsArchivePartitioned(
    ImpressionID      BIGINT              NOT NULL IDENTITY(1,1),
    ImpressionUID     UNIQUEIDENTIFIER    NOT NULL,
    ReferralURL       VARCHAR(512)        NOT NULL,
    CookieID          UNIQUEIDENTIFIER    NOT NULL,
    CampaignID        BIGINT              NOT NULL,
    RenderingID       BIGINT              NOT NULL,
    CountryCode       TINYINT             NULL,
    StateID           TINYINT             NULL,
    BrowserVersion    BIGINT              NOT NULL,
    OperatingSystemID BIGINT              NOT NULL,
    BidPrice          MONEY               NOT NULL,
    CostPerMille      MONEY               NOT NULL,
    EventTime         DATETIME            NOT NULL,
) ON ImpressionDatesPS(EventTime) ;
GO

ALTER TABLE dbo.ImpressionsArchivePartitioned ADD CONSTRAINT
   PK_ImpressionsArchivePartitioned PRIMARY KEY (ImpressionID, EventTime) ;
GO

INSERT INTO dbo.ImpressionsArchivePartitioned (
    ImpressionUID, 
    ReferralURL, 
    CookieID, 
    CampaignID, 
    RenderingID, 
    CountryCode, 
    StateID, 
    BrowserVersion, 
    OperatingSystemID, 
    BidPrice, 
    CostPerMille, 
    EventTime
)
SELECT 
      ImpressionUID
    , ReferralURL
    , CookieID
    , CampaignID
    , RenderingID
    , CountryCode
    , StateID
    , BrowserVersion
    , OperatingSystemID
    , BidPrice
    , CostPerMille
    , EventTime
FROM dbo.ImpressionsArchive ;
