--SQL Queries for Job Demand & Trends  

use JobMarketDB

select * from Job_Market

--Find the most frequently posted job roles.
select job_title , count(*) as job_count
from Job_Market
group by job_title
order by job_count desc

--Find the companies with the highest number of job postings.
select  company_name, count(*) as job_postings
from Job_Market
group by company_name 
order by job_postings desc

--Find which cities have the most job openings.
select  job_location, count(*) as job_openings
from Job_Market
group by  job_location
order by job_openings desc

--Identify the most in-demand skills across all job postings.
select skills_required, count(*) as demand 
from Job_Market
group by skills_required
order by demand desc

--Find jobs that require multiple programming skills (e.g., SQL + Python + C++).
select job_title,company_name,job_location,skills_required 
from Job_Market
where skills_required like '%SQL%' and skills_required like '%Python%' and skills_required like '%C++%'

--Identify the fastest-growing job roles based on month-over-month postings.
select Job_Title, 
       COUNT(CASE WHEN Posted_Date BETWEEN '2024-12-01' AND '2024-12-31' THEN 1 END) AS Dec_Postings,
       COUNT(CASE WHEN Posted_Date BETWEEN '2025-01-01' AND '2025-01-31' THEN 1 END) AS Jan_Postings
from job_market
group by  Job_Title
order by  Jan_Postings desc;

--Rank job postings based on the number of applications received.
select job_title, company_name,number_of_applicants,
rank () over (order by  number_of_applicants desc) as rank from Job_Market;




