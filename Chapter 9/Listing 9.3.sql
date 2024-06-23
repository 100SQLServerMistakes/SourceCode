CREATE DATABASE MarketingArchive ;
GO

USE MarketingArchive ;
GO

CREATE TABLE dbo.ImpressionsArchive (
	ImpressionID         BIGINT              NOT NULL IDENTITY PRIMARY KEY,
	ImpressionUID        UNIQUEIDENTIFIER    NOT NULL,
	ReferralURL          VARCHAR(512)        NOT NULL,
	CookieID             UNIQUEIDENTIFIER    NOT NULL,
	CampaignID           BIGINT              NOT NULL,
	RenderingID          BIGINT              NOT NULL,
	CountryCode          TINYINT             NULL,
	StateID              TINYINT             NULL,
	BrowserVersion       BIGINT              NOT NULL,
	OperatingSystemID    BIGINT              NOT NULL,
	BidPrice             MONEY               NOT NULL,
	CostPerMille         MONEY               NOT NULL,
	EventTime            DATETIME            NOT NULL,
) ;


DECLARE @Numbers TABLE (
    Number    INT
) ;

INSERT INTO @Numbers
VALUES (-1),(-2),(-3),(-4),(-5),(-6),(-7),(-8),(-9) ;

INSERT INTO MarketingArchive.dbo.ImpressionsArchive (
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
	DATEADD(YEAR, n.Number, i.EventTime)
FROM Marketing.Marketing.Impressions i
CROSS JOIN @Numbers n ;

CREATE NONCLUSTERED INDEX EventTimeNCI 
    ON dbo.ImpressionsArchive(EventTime) ;

CREATE NONCLUSTERED INDEX ImpressionUIDNCI 
    ON dbo.ImpressionsArchive(ImpressionUID) ;
