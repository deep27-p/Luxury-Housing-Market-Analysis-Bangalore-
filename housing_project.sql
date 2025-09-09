use housing_project;
select * from housing_table;
describe housing_table;
use housing_project;
/*1st question*/
use housing_project;
SELECT 
    Micro_Market,
    YEAR(Purchase_Quarter) AS Year,
    COUNT(CASE WHEN QUARTER(Purchase_Quarter) = 1 THEN 1 END) AS Q1_Bookings,
    COUNT(CASE WHEN QUARTER(Purchase_Quarter) = 2 THEN 1 END) AS Q2_Bookings,
    COUNT(CASE WHEN QUARTER(Purchase_Quarter) = 3 THEN 1 END) AS Q3_Bookings,
    COUNT(CASE WHEN QUARTER(Purchase_Quarter) = 4 THEN 1 END) AS Q4_Bookings,
    COUNT(*) AS Total_Yearly_Bookings
FROM housing_table
WHERE Purchase_Quarter IS NOT NULL
GROUP BY Micro_Market, YEAR(Purchase_Quarter)
ORDER BY Micro_Market, Year;
/*2nd question*/
USE housing_project;
SELECT 
    Developer_Name,
    ROUND(AVG(Ticket_Price_Cr), 2) AS Average_Ticket_Price_Cr
FROM housing_table
WHERE Ticket_Price_Cr IS NOT NULL
GROUP BY Developer_Name
ORDER BY Average_Ticket_Price_Cr DESC;
/*3rd question*/
USE housing_project;

SELECT 
    Amenity_Score,
    COUNT(Property_ID) * 100.0 / (SELECT COUNT(*) FROM housing_table) AS Booking_Success_Rate,
    COUNT(DISTINCT Project_Name) AS Project_Count
FROM housing_table
WHERE Amenity_Score IS NOT NULL
GROUP BY Amenity_Score
ORDER BY Amenity_Score;
/*4th question*/
SELECT 
    Micro_Market,
    SUM(CASE WHEN Possession_Status = 'Ready to Move' THEN 1 ELSE 0 END) AS Booked_Count,
    SUM(CASE WHEN Possession_Status = 'Launch' THEN 1 ELSE 0 END) AS Not_Booked_Count,
    COUNT(*) AS Total_Projects,
    ROUND(
        (SUM(CASE WHEN Possession_Status = 'Ready to Move' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ) AS Booking_Conversion_Percentage
FROM housing_table
GROUP BY Micro_Market
ORDER BY Booking_Conversion_Percentage DESC;

/*5th question*/
use housing_project;
SELECT 
    Configuration,
    COUNT(*) AS Booking_Count
FROM housing_table
GROUP BY Configuration
ORDER BY Booking_Count DESC;
/*6th question*/
use housing_project;
SELECT 
    Sales_Channel,
    SUM(CASE WHEN Possession_Status = 'Launch' THEN 1 ELSE 0 END) AS Launch,
    SUM(CASE WHEN Possession_Status = 'Ready to move' THEN 1 ELSE 0 END) AS Ready_to_move,
    SUM(CASE WHEN Possession_Status = 'Under construction' THEN 1 ELSE 0 END) AS Under_construction
FROM housing_table
GROUP BY Sales_Channel
ORDER BY Sales_Channel;

/*7th question*/
use housing_project;
SELECT 
    Developer_Name,
    COUNT(Purchase_Quarter) AS Total_Purchases
FROM housing_table
GROUP BY Developer_Name
ORDER BY Total_Purchases DESC;

/*8th question*/
use housing_project;
SELECT 
    Possession_Status,
    SUM(CASE WHEN Transaction_Type = 'Primary' THEN 1 ELSE 0 END) AS `Primary_Count`,
    SUM(CASE WHEN Transaction_Type = 'Secondary' THEN 1 ELSE 0 END) AS `Secondary_Count`
FROM 
    housing_table
GROUP BY 
    Possession_Status
ORDER BY 
    Possession_Status;
    
    /*9th question*/
use housing_project;
SELECT 
    Micro_Market,
    COUNT(DISTINCT Project_Name) AS Project_Count,
    SUM(Ticket_Price_Cr) AS Total_Sales
FROM 
    housing_table
GROUP BY 
    Micro_Market
ORDER BY 
    Project_Count DESC;
    
     /*10th question*/
SELECT 
    Developer_Name,
    SUM(Ticket_Price_Cr) AS Total_Revenue,
    COUNT(Property_ID) AS Booking_Count
FROM 
    housing_table
GROUP BY 
    Developer_Name
ORDER BY 
    Total_Revenue DESC
LIMIT 5;


