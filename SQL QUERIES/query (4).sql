SELECT TOP 10 
    fps.Player_ID,
    dp.Player_Name,
    SUM(fps.Goals_Scored) AS Total_Goals
FROM 
    dbo.fact_player_statistics fps
INNER JOIN 
    dbo.dim_time dt ON fps.Time_ID = dt.Time_ID
LEFT JOIN 
    dbo.dim_player dp ON fps.Player_ID = dp.Player_ID
WHERE 
    dt.Year = 2010
GROUP BY 
    fps.Player_ID, dp.Player_Name
ORDER BY 
    Total_Goals DESC;
