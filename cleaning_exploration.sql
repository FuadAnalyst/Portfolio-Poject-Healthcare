SELECT *
FROM patient_data
LIMIT 10;

-- Change "Date of Admission" data type
ALTER TABLE patient_data
ALTER COLUMN "Date of Admission" TYPE DATE USING ("Date of Admission"::DATE);


-- Change "Discharge Date" data type
ALTER TABLE patient_data
ALTER COLUMN "Discharge Date" TYPE DATE USING ("Discharge Date"::DATE);


-- Round "Billing Amount"
UPDATE patient_data
SET "Billing Amount" = ROUND("Billing Amount"::numeric, 2);

SELECT *
FROM patient_data
LIMIT 10;


-- Getting all possible results from "Test Results"
SELECT DISTINCT "Test Results"
FROM patient_data;


-- Top 5 Hospitals by amount of patients
SELECT "Hospital", COUNT(*) AS patients
FROM patient_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


-- Average age for each medical condition
SELECT "Medical Condition", AVG("Age")::INT AS "Average age"
FROM patient_data
GROUP BY 1;


-- The most visited hospitals by medical condition
SELECT "Hospital", "Medical Condition", COUNT(*) AS "times"
FROM patient_data
GROUP BY 1,2
order by 3 desc;


-- Create a new column and find how many days each patient stayed in hospital
ALTER TABLE patient_data
ADD COLUMN "Days in hospital" INT;

UPDATE patient_data
SET "Days in hospital" = "Discharge Date" - "Date of Admission";


-- Create a new column - age group
ALTER TABLE patient_data
ADD COLUMN "Age group" VARCHAR;

UPDATE patient_data
SET "Age group" = CASE
    WHEN "Age" >= 18 AND "Age" < 31 THEN 'Young adults'
    WHEN "Age" >= 31 AND "Age" < 46 THEN 'Middle-aged adults'
    WHEN "Age" >= 46 THEN 'Old-aged adults'
    ELSE 'Child'
END;


-- Average billing amount for each age group
SELECT "Age group", 
		ROUND(AVG("Billing Amount")::DECIMAL, 2) AS "Average billing amount"
FROM patient_data
GROUP BY 1
ORDER BY 2 DESC;

SELECT *
FROM patient_data
LIMIT 10;


-- Find first patient for each Hospital
with CTE_first AS (
	SELECT "Hospital", "Name", "Age", 
		   "Gender", "Medical Condition", 
		   "Days in hospital",
		   ROW_NUMBER() OVER (PARTITION BY "Hospital" ORDER BY "Date of Admission") AS "First"
	FROM patient_data
)
SELECT * FROM CTE_first
WHERE "First" = 1;


-- How many percent of the total billing amount are accounted for by the top 5 hospitals?
with CTE_top AS ( -- Finding top 5 hospitals by total billing amount
	SELECT "Hospital", SUM("Billing Amount")::DECIMAL AS "Total billing amount"
	FROM patient_data
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 5
)
SELECT ROUND(SUM("Total billing amount") / (SELECT SUM("Billing Amount")::DECIMAL FROM patient_data) * 100, 2) AS "Result"
FROM CTE_top


-- Percentage of medical condition for each age group
with CTE_1 AS (
	SELECT "Age group", "Medical Condition", COUNT(*) AS "Count"
	FROM patient_data
	GROUP BY 1,2
	ORDER BY 1
),
CTE2 AS (
	SELECT "Medical Condition", 
			COUNT(*) as "Count per condition"
	FROM patient_data
	GROUP BY 1
)
SELECT "Age group", CTE_1."Medical Condition", 
	ROUND("Count"::decimal / "Count per condition"::decimal * 100, 2) as "Result"
FROM CTE_1 
	INNER JOIN CTE2 USING("Medical Condition")