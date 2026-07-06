--1. Filtering by Indicators--
SELECT DISTINCT GHO_DISPLAY
FROM health_raw
WHERE GHO_DISPLAY LIKE '%Stunting%'
   OR GHO_DISPLAY LIKE '%Wasting%'
   OR GHO_DISPLAY LIKE '%Underweight%'
   OR GHO_DISPLAY LIKE '%Overweight%'
ORDER BY GHO_DISPLAY;


--2. Creating Filtered Table--
SELECT
    GHO_DISPLAY,
    STARTYEAR,
    DIMENSION_TYPE,
    DIMENSION_NAME,
    Numeric
INTO nutrition_inequality
FROM health_raw
WHERE DIMENSION_TYPE IN
(
    'EDUCATIONLEVEL',
    'WEALTHQUINTILE',
    'RESIDENCEAREATYPE'
)
AND
(
    GHO_DISPLAY LIKE '%Stunting%'
    OR GHO_DISPLAY LIKE '%Wasting%'
    OR GHO_DISPLAY LIKE '%Underweight%'
    OR GHO_DISPLAY LIKE '%Overweight%'
);


--3. Checking the new table--
SELECT COUNT(*) 
FROM nutrition_inequality


SELECT TOP 20 *
FROM nutrition_inequality

SELECT *
FROM nutrition_inequality



--4. Check the distribution--
SELECT
    DIMENSION_TYPE,
    COUNT(*) AS Records
FROM nutrition_inequality
GROUP BY DIMENSION_TYPE
ORDER BY Records DESC;

--5. Check by Indicators--
SELECT
    GHO_DISPLAY,
    COUNT(*) AS Records
FROM nutrition_inequality
GROUP BY GHO_DISPLAY
ORDER BY Records DESC;


--6. Which Wealth Group Has The Highest Stunting?

SELECT
    DIMENSION_NAME AS WealthGroup,
    AVG(Numeric) AS AvgStunting
FROM nutrition_inequality
WHERE DIMENSION_TYPE = 'WEALTHQUINTILE'
AND GHO_DISPLAY LIKE '%Stunting%'
GROUP BY DIMENSION_NAME
ORDER BY AvgStunting DESC;

--7. Which Education Group Has The Highest Stunting?--

SELECT
    DIMENSION_NAME AS EducationLevel,
    AVG(Numeric) AS AvgStunting
FROM nutrition_inequality
WHERE DIMENSION_TYPE = 'EDUCATIONLEVEL'
AND GHO_DISPLAY LIKE '%Stunting%'
GROUP BY DIMENSION_NAME
ORDER BY AvgStunting DESC;

--8. Which Residence Group Has The Highest Stunting?--

SELECT
    DIMENSION_NAME AS ResidenceType,
    AVG(Numeric) AS AvgStunting
FROM nutrition_inequality
WHERE DIMENSION_TYPE = 'RESIDENCEAREATYPE'
AND GHO_DISPLAY LIKE '%Stunting%'
GROUP BY DIMENSION_NAME
ORDER BY AvgStunting DESC;

--9. Which Wealth Group Has The Highest Underweight--
SELECT
    DIMENSION_NAME,
    AVG(Numeric) AS AvgUnderweight
FROM nutrition_inequality
WHERE GHO_DISPLAY LIKE '%Underweight%'
AND DIMENSION_TYPE = 'WEALTHQUINTILE'
GROUP BY DIMENSION_NAME
ORDER BY AvgUnderweight DESC;

--10. Which EducationLevel Has The Highest Underweight--
SELECT
    DIMENSION_NAME,
    AVG(Numeric) AS AvgUnderweight
FROM nutrition_inequality
WHERE GHO_DISPLAY LIKE '%Underweight%'
AND DIMENSION_TYPE = 'EDUCATIONLEVEL'
GROUP BY DIMENSION_NAME
ORDER BY AvgUnderweight DESC;

--10. Which Residence group Has The Highest Underweight--
SELECT
    DIMENSION_NAME,
    AVG(Numeric) AS AvgUnderweight
FROM nutrition_inequality
WHERE GHO_DISPLAY LIKE '%Underweight%'
AND DIMENSION_TYPE = 'RESIDENCEAREATYPE'
GROUP BY DIMENSION_NAME
ORDER BY AvgUnderweight DESC;

--11. Which Wealth group Has The Highest Wasting--
SELECT
    DIMENSION_NAME AS WealthGroup,
    AVG(Numeric) AS AvgWasting
FROM nutrition_inequality
WHERE DIMENSION_TYPE = 'WEALTHQUINTILE'
AND DIMENSION_NAME <> 'Total'
AND GHO_DISPLAY LIKE '%Wasting%'
GROUP BY DIMENSION_NAME
ORDER BY AvgWasting DESC;

--12.Which Education group Has The Highest Wasting--

SELECT
    DIMENSION_NAME AS EducationLevel,
    AVG(Numeric) AS AvgWasting
FROM nutrition_inequality
WHERE DIMENSION_TYPE = 'EDUCATIONLEVEL'
AND DIMENSION_NAME <> 'Total'
AND GHO_DISPLAY LIKE '%Wasting%'
GROUP BY DIMENSION_NAME
ORDER BY AvgWasting DESC;

--13.Which Residence  group Has The Highest Wasting--
SELECT
    DIMENSION_NAME AS ResidenceType,
    AVG(Numeric) AS AvgWasting
FROM nutrition_inequality
WHERE DIMENSION_TYPE = 'RESIDENCEAREATYPE'
AND DIMENSION_NAME <> 'Total'
AND GHO_DISPLAY LIKE '%Wasting%'
GROUP BY DIMENSION_NAME
ORDER BY AvgWasting DESC;

--15.Which Wealth group Has The Highest Overweight--
SELECT
    DIMENSION_NAME AS WealthGroup,
    AVG(Numeric) AS AvgOverweight
FROM nutrition_inequality
WHERE DIMENSION_TYPE = 'WEALTHQUINTILE'
AND DIMENSION_NAME <> 'Total'
AND GHO_DISPLAY LIKE '%Overweight%'
GROUP BY DIMENSION_NAME
ORDER BY AvgOverweight DESC;

--16.Which Education group Has The Highest Overweight--
SELECT
    DIMENSION_NAME AS EducationLevel,
    AVG(Numeric) AS AvgOverweight
FROM nutrition_inequality
WHERE DIMENSION_TYPE = 'EDUCATIONLEVEL'
AND DIMENSION_NAME <> 'Total'
AND GHO_DISPLAY LIKE '%Overweight%'
GROUP BY DIMENSION_NAME
ORDER BY AvgOverweight DESC;

--17.Which Residence group Has The Highest Overweight--
SELECT
    DIMENSION_NAME AS ResidenceType,
    AVG(Numeric) AS AvgOverweight
FROM nutrition_inequality
WHERE DIMENSION_TYPE = 'RESIDENCEAREATYPE'
AND DIMENSION_NAME <> 'Total'
AND GHO_DISPLAY LIKE '%Overweight%'
GROUP BY DIMENSION_NAME
ORDER BY AvgOverweight DESC;