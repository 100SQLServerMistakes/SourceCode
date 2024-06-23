CREATE NONCLUSTERED INDEX CampaignIDCountryCodeWithBidPrice
ON dbo.ImpressionsArchive(CampaignID, CountryCode)
INCLUDE (BidPrice) ;
GO
