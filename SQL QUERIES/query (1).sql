CREATE TABLE dim_league (
    League_ID INT PRIMARY KEY,
    League_Name NVARCHAR(100)
);

CREATE TABLE dim_club (
    Club_ID INT PRIMARY KEY,
    Club_Name NVARCHAR(100),
    League_Name NVARCHAR(100),
    Manager NVARCHAR(100),
    Owner NVARCHAR(100),
    League_ID INT
);

CREATE TABLE dim_country (
    Country_ID INT PRIMARY KEY,
    Country_Name NVARCHAR(100),
    Coach NVARCHAR(100)
);

CREATE TABLE dim_match_type (
    Match_Type_ID INT PRIMARY KEY,
    Match_Name NVARCHAR(100)
);

CREATE TABLE dim_player (
    Player_ID INT PRIMARY KEY,
    Player_Name NVARCHAR(100),
    Club_Name NVARCHAR(100),
    Country_Name NVARCHAR(100),
    Position NVARCHAR(50),
    Jersey_Number INT,
    DOB DATE,
    Nationality NVARCHAR(50),
    Club_ID INT,
    Country_ID INT
);

CREATE TABLE dim_time (
    Time_ID INT PRIMARY KEY,
    Date_Key NVARCHAR(50),
    Year INT,
    Quarter VARCHAR(10),
    Month INT
);

CREATE TABLE fact_player_statistics (
    Fact_ID INT PRIMARY KEY,
    Time_ID INT,
    Match_Type_ID INT,
    Player_ID INT,
    Club_ID INT,
    Country_ID INT,
    Appearances INT,
    Goals_Scored INT,
    Goals_Assist INT,
    Total_Shots INT,
    Shots_on_Target INT,
    Fouls_Made INT,
    Fouls_Suffered INT,
    Yellow_Card INT,
    Red_Card INT,
    Goals_Saved INT,
    Goals_Conceded INT,
    Total_Penalty INT,
    Successful_Penalty INT,
    Salary FLOAT
);

CREATE TABLE fact_team_statistics (
    Fact_ID INT PRIMARY KEY,
    Time_ID INT,
    Match_Type_ID INT,
    League_ID INT,
    Club_ID INT,
    Country_ID INT,
    Appearances INT,
    Wins INT,
    Lost INT,
    Drawn INT,
    Clean_Sheets INT,
    Net_Worth FLOAT
);