
--Needed Data Modelling And Cleaning in the Dataset


USE JobMarketDB;
ALTER TABLE Job_Market ADD average_salary inT;

UPDATE Job_Market  
SET MinSalary = TRY_CAST(REPLACE(LEFT(Salary_Range, CHARINDEX('-', Salary_Range) - 1), ' LPA', '') AS INT),  
    MaxSalary = TRY_CAST(REPLACE(RIGHT(Salary_Range, CHARINDEX('-', REVERSE(Salary_Range)) - 1), ' LPA', '') AS INT)
WHERE Salary_Range LIKE '%-%';
UPDATE Job_Market  
SET Salary_Range = REPLACE(Salary_Range, '+', '')  
WHERE Salary_Range LIKE '%+%';
UPDATE Job_Market  
SET MinSalary = TRY_CAST(REPLACE(Salary_Range, ' LPA', '') AS INT),  
    MaxSalary = TRY_CAST(REPLACE(Salary_Range, ' LPA', '') AS INT)  
WHERE Salary_Range NOT LIKE '%-%' AND Salary_Range LIKE '% LPA';
UPDATE job_market
SET average_salary = (MinSalary + MaxSalary) / 2
WHERE MinSalary IS NOT NULL AND MaxSalary IS NOT NULL;
UPDATE job_market
SET Min_Experience = TRY_CAST(LEFT(Experience_Required, CHARINDEX(' ', Experience_Required) - 1) AS INT)
WHERE Experience_Required IS NOT NULL AND Experience_Required LIKE '[0-9]%';
ALTER TABLE Job_Market ADD Min_Experience INT, Max_Experience INT;
UPDATE job_market  
SET Min_Experience = CASE  
           WHEN Experience_Required LIKE '%+%'  
           THEN CAST(REPLACE(LEFT(Experience_Required, CHARINDEX('+', Experience_Required) - 1), ' years', '') AS INT)  
           WHEN Experience_Required LIKE '%-%'  
           THEN CAST(REPLACE(LEFT(Experience_Required, CHARINDEX('-', Experience_Required) - 1), ' years', '') AS INT)  
           ELSE NULL  
       END,  
    Max_Experience = CASE  
           WHEN Experience_Required LIKE '%+%'  
           THEN NULL  -- No upper limit for "10+ years"  
           WHEN Experience_Required LIKE '%-%'  
           THEN CAST(REPLACE(RIGHT(Experience_Required, LEN(Experience_Required) - CHARINDEX('-', Experience_Required)), ' years', '') AS INT)  
           ELSE NULL  
       END;
	   UPDATE job_market  
SET Min_Experience = ISNULL(Min_Experience, 0),  
    Max_Experience = ISNULL(Max_Experience, 0);
	UPDATE job_market  
SET Max_Experience = 20  
WHERE Experience_Required LIKE '%+%' AND Max_Experience = 0;
SELECT Job_ID, Experience_Required, Min_Experience, Max_Experience  
FROM job_market  
WHERE Max_Experience = 0 OR Max_Experience = 20;

SELECT TOP  10 * from Job_Market


