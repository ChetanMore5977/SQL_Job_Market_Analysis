USE JobMarketDB;
--SQL Queries for Experience-Based Analysis =>

--1) Find entry-level jobs (0-2 years of experience).
select * from Job_Market
where Max_Experience <= 2

--2) Find mid-level jobs (3-7 years of experience).
select * from Job_Market
where Max_Experience between 3 and 7


--3) Find senior-level jobs (8+ years of experience).
select * from Job_Market
where Min_Experience >= 8


--4) Find the highest-paying jobs for each experience level using DENSE_RANK().
select job_title,company_name,min_experience,maxsalary 
from
( select job_title,company_name,min_experience,maxsalary,
DENSE_RANK () over (partition by min_experience order by maxsalary desc) as salary_rank
from Job_Market
)  ranked_job
where salary_rank = 1

--5) Find the most common experience range for job postings.
select min_experience , count (*) as job_count
from job_market 
group by min_experience
order by job_count desc

--6) Find companies that mostly hire freshers (Min_Experience = 0 or 1).
select job_title,company_name,min_experience from Job_Market
where Min_Experience <=1;


