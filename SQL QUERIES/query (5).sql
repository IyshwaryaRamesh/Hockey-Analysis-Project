SELECT TOP 5
    fps.Player_ID,
    dp.Player_Name,
    SUM(fps.Red_Card) AS Total_Red_Cards
FROM 
    dbo.fact_player_statistics fps
LEFT JOIN 
    dbo.dim_player dp ON fps.Player_ID = dp.Player_ID
GROUP BY 
    fps.Player_ID, dp.Player_Name
ORDER BY 
    Total_Red_Cards DESC;
