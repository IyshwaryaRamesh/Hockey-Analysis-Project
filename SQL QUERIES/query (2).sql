SELECT 
    p.Player_ID, 
    p.Player_Name, 
    c.Country_Name, 
    cl.Club_Name
FROM 
    dim_player p
LEFT JOIN 
    dim_country c ON p.Country_ID = c.Country_ID
LEFT JOIN 
    dim_club cl ON p.Club_ID = cl.Club_ID;
