CREATE DATABASE Marketing ;
GO

USE Marketing ;
GO

CREATE SCHEMA staging ;
GO

CREATE SCHEMA marketing ;
GO

CREATE SCHEMA reporting ;
GO

CREATE TABLE staging.ImpressionsStage (
    ImpressionUID        VARCHAR(MAX)    NULL,
    ReferralURL          VARCHAR(MAX)    NULL,
    CookieID             VARCHAR(MAX)    NULL,
    CampaignID           VARCHAR(MAX)    NULL,
    RenderingID          VARCHAR(MAX)    NULL,
    CountryCode          VARCHAR(MAX)    NULL,
    StateID              VARCHAR(MAX)    NULL,
    BrowserVersion       VARCHAR(MAX)    NULL,
    OperatingSystemID    VARCHAR(MAX)    NULL,
    CostPerMille         VARCHAR(MAX)    NULL,
    EventTime            VARCHAR(MAX)    NULL,
    BidPrice             VARCHAR(MAX)    NULL
) ;

CREATE TABLE marketing.Impressions (
    ImpressionID       BIGINT            NOT NULL    PRIMARY KEY  IDENTITY,
    ImpressionUID      UNIQUEIDENTIFIER  NOT NULL,
    ReferralURL        VARCHAR(512)      NOT NULL,
    CookieID           UNIQUEIDENTIFIER  NOT NULL,
    CampaignID         BIGINT            NOT NULL,
    RenderingID        BIGINT            NOT NULL,
    CountryCode        TINYINT           NULL,
    StateID            TINYINT           NULL,
    BrowserVersion     BIGINT            NOT NULL,
    OperatingSystemID  BIGINT            NOT NULL,
    BidPrice           MONEY             NOT NULL,
    CostPerMille       MONEY             NOT NULL,
    EventTime          DATETIME          NOT NULL
) ;

CREATE TABLE reporting.ImpressionAggregates (
    ImpressionAggregateID    BIGINT    NOT NULL    PRIMARY KEY  IDENTITY,
    CampaignID               BIGINT    NOT NULL,
    CountryCode              TINYINT   NOT NULL,
    EventDate                DATE      NOT NULL,
    AvgBidPrice              MONEY     NOT NULL,
    AvgCostPerMille          MONEY     NOT NULL
) ;
