--1. Verify import --
SELECT TOP 10 *
FROM health_raw;

--2. Check dataset size--
SELECT COUNT(*) AS TotalRows
FROM health_raw;


--3. Check Column structure--
SELECT
COLUMN_NAME,
DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'health_raw';

--4. Missing value Investigation--
SELECT 
COUNT(*) AS MissingNumeric
FROM health_raw
WHERE Numeric IS NULL;

SELECT 
COUNT(*) AS MissingDiMType
FROM health_raw
WHERE [DIMENSION_TYPE] IS NULL;

SELECT 
COUNT(*) AS MissingDIMNAME
FROM health_raw
WHERE [DIMENSION_NAME] IS NULL;

--5. Investigate missing Numeric values--
SELECT TOP 100
	Value,
	Numeric
FROM health_raw
WHERE NUMERIC IS NULL;


--6. Verify the Health inequality Indicators--
SELECT COUNT(*) AS TOTALRWS
FROM health_raw;

SELECT DISTINCT [GHO_DISPLAY]
FROM health_raw
WHERE [DIMENSION_TYPE] = 'SEX'
ORDER BY [GHO_DISPLAY];

SELECT DISTINCT [GHO_DISPLAY]
FROM health_raw
WHERE [DIMENSION_TYPE] = 'WEALTHQUINTILE'
ORDER BY [GHO_DISPLAY];

SELECT DISTINCT [GHO_DISPLAY]
FROM health_raw
WHERE [DIMENSION_TYPE] = 'EDUCATIONLEVEL'
ORDER BY [GHO_DISPLAY];

SELECT DISTINCT [GHO_DISPLAY]
FROM health_raw
WHERE [DIMENSION_TYPE] = 'RESIDENCEAREATYPE'
ORDER BY [GHO_DISPLAY];

--7. Indicator Recheck--
SELECT DISTINCT GHO_DISPLAY
FROM health_raw
ORDER BY GHO_DISPLAY;