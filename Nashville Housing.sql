create database Projects;
select * from dbo.NashvilleHousingData;

-- Checking out the total number of properties in Nashville by land use
-- First, let's clean the inconsistencies in the LandUse column

UPDATE NashvilleHousingData 
SET LandUse = 'GREENBELT'
WHERE LandUse LIKE 'GREENBELT%';


UPDATE NashvilleHousingData 
SET LandUse = 'VACANT RESIDENTIAL LAND'
WHERE LandUse LIKE 'VACANT RES%';
 
 -- converting the column TotalValue to the appropriate datatype (INT)

ALTER TABLE NashvilleHousingData
ALTER COLUMN TotalValue INT;

SELECT LandUse, COUNT(*) AS num_of_properties,
AVG(TRY_CAST(TotalValue AS BIGINT)) AS property_value
FROM NashvilleHousingData
WHERE TRY_CAST(TotalValue AS BIGINT) IS NOT NULL
GROUP BY LandUse
ORDER BY LandUse;

-- Total sales and value sold by landuse

 SELECT LandUse, COUNT(*) AS qty_sold,
 SUM(TRY_CAST(SalePrice AS BIGINT)) as sales, SUM(TRY_CAST(TotalValue AS BIGINT)) as sales_value,
 SUM(TRY_CAST(SalePrice AS BIGINT)) - SUM(TRY_CAST(TotalValue AS BIGINT)) as profit
 FROM NashvilleHousingData
 WHERE TotalValue IS NOT NULL
 GROUP BY LandUse
 ORDER BY SUM(TRY_CAST(SalePrice AS BIGINT)) - SUM(TRY_CAST(TotalValue AS BIGINT)) DESC;

 -- Most valued properties

 SELECT TOP 10 *
 FROM NashvilleHousingData
 WHERE TotalValue IS NOT NULL
 ORDER BY TotalValue DESC;

 -- Yearly Sales

 SELECT YEAR(SaleDate) AS year,
 COUNT(*) AS qty_sold,
 AVG(TRY_CAST(SalePrice AS BIGINT)) AS avg_sales
 FROM NashvilleHousingData
 GROUP BY YEAR(SaleDate)
 ORDER BY YEAR(SaleDate);


 -- Tax district Analysis

 SELECT TaxDistrict,
 COUNT(*) AS qty_sold,
 SUM(TRY_CAST(SalePrice AS BIGINT)) AS sales
 FROM NashvilleHousingData
 WHERE SalePrice IS NOT NULL AND TaxDistrict IS NOT NULL
 GROUP BY TaxDistrict
 ORDER BY TaxDistrict;

 -- Bedroom Analysis

 SELECT Bedrooms, COUNT(*) AS qty_sold,
 SUM(SalePrice) as sales
 FROM NashvilleHousingData
 WHERE Bedrooms IS NOT NULL
 GROUP BY Bedrooms
 ORDER BY Bedrooms;

 -- Vacancy Analysis

 SELECT CASE WHEN SoldAsVacant = 0 THEN 'OCCUPIED' ELSE 'VACANT' END AS apartment_status,
 COUNT(*) AS qty_sold,
 SUM(SalePrice) as sales
 FROM NashvilleHousingData
 WHERE SoldAsVacant IS NOT NULL
 GROUP BY SoldAsVacant
 ORDER BY SoldAsVacant;