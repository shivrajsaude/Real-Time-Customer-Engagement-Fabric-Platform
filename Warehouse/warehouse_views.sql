CREATE VIEW vw_customer_engagement AS
SELECT *
FROM lh_customer_engagement.dbo.gold_customer_engagement;
GO

CREATE VIEW vw_campaign_performance AS
SELECT *
FROM lh_customer_engagement.dbo.gold_campaign_performance;
GO

CREATE VIEW vw_support_summary AS
SELECT *
FROM lh_customer_engagement.dbo.gold_support_summary;
GO


SELECT TOP 10 *
FROM vw_customer_engagement;
GO

SELECT TOP 10 *
FROM vw_campaign_performance;
GO

SELECT TOP 10 *
FROM vw_support_summary;
GO