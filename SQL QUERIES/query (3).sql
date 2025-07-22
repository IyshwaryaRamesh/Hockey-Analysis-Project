WITH fact_with_match AS (
    SELECT 
        fps.Player_ID,
        fps.Appearances,
        mt.Match_Name
    FROM 
        dbo.fact_player_statistics fps
    LEFT JOIN 
        dbo.dim_match_type mt ON fps.Match_Type_ID = mt.Match_Type_ID
    WHERE 
        mt.Match_Name = 'International'
),

max_appearance AS (
    SELECT 
        Player_ID,
        SUM(Appearances) AS Total_Appearances
    FROM 
        fact_with_match
    GROUP BY 
        Player_ID
),

max_value AS (
    SELECT 
        MAX(Total_Appearances) AS Max_Appearance
    FROM 
        max_appearance
)

SELECT 
    ma.Player_ID, 
    dp.Player_Name, 
    ma.Total_Appearances
FROM 
    max_appearance ma
JOIN 
    max_value mv ON ma.Total_Appearances = mv.Max_Appearance
LEFT JOIN 
    dbo.dim_player dp ON ma.Player_ID = dp.Player_ID;
