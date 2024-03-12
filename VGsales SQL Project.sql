SELECT *
FROM Project..[vgsalesdetails]

Select *
FROM Project..[vgsales]

--total sales for eac country

SELECT COUNT (NA_Sales) AS 'NA_Sales Total', COUNT (EU_Sales) AS 'EU_Sales Total',
COUNT (JP_Sales) AS 'JP_Sales Total', COUNT (Other_Sales) AS 'Other_Sales Total',
COUNT (Global_Sales) AS 'Global_Sales Total'
FROM Project..[vgsalesdetails]

--Total Sales

SELECT COUNT (NA_Sales) + COUNT (Global_Sales) + COUNT (JP_Sales) + COUNT (Other_Sales), + COUNT (EU_Sales) AS Total_Sales
FROM Project..[vgsalesdetails]

-- Which Products had the highest number of sales

SELECT Name, Genre, Year, NA_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	ON SD.Rank = VGS.Rank
	--WHERE Year is not null
	ORDER BY 4 DESC
--Wii Sport had the highest sales for NA_Sales

SELECT Name, Genre, Year, EU_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	ON SD.Rank = VGS.Rank
	--WHERE Year is not null
	ORDER BY 4 DESC
--Wii Sport had the highest sales for EU_Sales

SELECT Name, Genre, Year, JP_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	ON SD.Rank = VGS.Rank
	--WHERE Year is not null
	ORDER BY 4 DESC
--Pokemon REd sold the highest for JP_Sales

SELECT Name, Genre, Year, Other_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	ON SD.Rank = VGS.Rank
	--WHERE Year is not null
	ORDER BY 4 DESC
--Grand Theft Auto sold the highest for Other_sales

SELECT Name, Genre, Year, Global_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	ON SD.Rank = VGS.Rank
	--WHERE Year is not null
	ORDER BY 4 DESC
--Wii Sport had the highest sales for Global_Sales

--The with the highest number of sales

SELECT Year, COUNT (EU_Sales) AS EU_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	on SD.Rank = VGS.Rank
Group  by Year
ORDER BY 2 DESC
--2009 WAS THE YEAR WITH THE HIGHEST SALES IN EU

SELECT Year, COUNT (NA_Sales) AS NA_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	on SD.Rank = VGS.Rank
Group  by Year
ORDER BY 2 DESC
--2009 WAS THE YEAR WITH THE HIGHEST SALES IN NA

SELECT Year, COUNT (JP_Sales) AS JP_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	on SD.Rank = VGS.Rank
Group  by Year
ORDER BY 2 DESC
--2009 WAS THE YEAR WITH THE HIGHEST SALES IN JP

SELECT Year, COUNT (JP_Sales) AS JP_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	on SD.Rank = VGS.Rank
Group  by Year
ORDER BY 2 DESC
--2009 WAS THE YEAR WITH THE HIGHEST SALES IN JP

SELECT Year, COUNT (Other_Sales) AS Other_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	on SD.Rank = VGS.Rank
Group  by Year
ORDER BY 2 DESC
--2009 WAS THE YEAR WITH THE HIGHEST SALES IN Other-Sales

SELECT Year, COUNT (Global_Sales) AS Global_Sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	on SD.Rank = VGS.Rank
Group  by Year
ORDER BY 2 DESC
--2009 WAS THE YEAR WITH THE HIGHEST SALES IN Global-Sales

--JOIN OF BOTH TABLES WITH CTE

WITH CTE_Joinoftables as
(
SELECT VGS.Rank, Platform, Year, Genre, Publisher, NA_sales, EU_sales, JP_sales, Other_sales, Global_sales
FROM Project..[vgsalesdetails] SD
JOIN Project..[vgsales] VGS
	on SD.Rank = VGS.Rank
	)

SELECT *
FROM CTE_Joinoftables