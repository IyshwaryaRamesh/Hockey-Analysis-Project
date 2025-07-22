SELECT TOP 5
    fts.Club_ID,
    dc.Club_Name,
    SUM(fts.Wins) AS Total_Wins
FROM 
    dbo.fact_team_statistics fts
LEFT JOIN 
    dbo.dim_club dc ON fts.Club_ID = dc.Club_ID
GROUP BY 
    fts.Club_ID, dc.Club_Name
ORDER BY 
    Total_Wins DESC;
