USE JobMarketDB;
--SQL Queries for Salary-Based Analysis =>

--1️) Find the top 10 highest-paying jobs in the dataset.

SELECT distinct top 10 Job_Title, Company_Name, MaxSalary
FROM Job_Market  
ORDER BY MaxSalary DESC;


--2️) Compare salary ranges between companies for the same job title.

select job_title, company_name,MINSALARY,MAXSALARY 
from Job_Market
where  job_title = 'Business Analyst'
order by MaxSalary desc;


--3️) Find the highest-paying job in each work mode (Remote, Hybrid, Onsite)

select remote_onsite,job_title,company_name,maxsalary
from
( select remote_onsite,job_title,company_name,maxsalary,
rank() over (partition by remote_onsite order by maxsalary desc ) as rank
from job_market
) ranked_jobs
where rank = 1;

--4️) Calculate the average salary for each experience level (Min_Experience).

select Min_Experience, AVG(MaxSalary) as avg_salary
from Job_Market
group by Min_Experience
order by Min_Experience ;

--5️) Find job roles where the maximum salary is more than 15 LPA.

select job_title, Company_Name, maxsalary 
from Job_Market
where maxsalary > 15

--6️) Find companies that pay above the industry average for a given job title.

with avgsalary as  
(select job_title, avg (maxsalary) as industry_avg_salary
from Job_Market
group by job_title
)
select jm.company_name,jm.job_title, jm.maxsalary, a.industry_avg_salary
from Job_Market jm
join avgsalary a on jm.Job_Title = a.Job_Title
where jm.MaxSalary >  a.industry_avg_salary
order by jm.Job_Title,jm.Company_Name ;


--7️) Find jobs where the salary range is unusually high (difference between Min_Salary and Max_Salary is more than 7 LPA).

select job_title , company_name , maxsalary-minsalary as salary_difference
from job_market
where maxsalary-minsalary > 7
order by job_title , company_name desc;




