
select * from job_market

--SQL Queries for Application Process & Deadlines=>


--Find jobs with the shortest application window (DATEDIFF(EndDate, StartDate))
select job_title,company_name,posted_date,Application_Deadline,
datediff (day,posted_date,Application_Deadline) as application_duration
from Job_Market
order by application_duration ;

--Find jobs where the application deadline is in the next 7 days.
select job_title,company_name, application_deadline
from Job_Market
where Application_Deadline between  DATEADD(DAY, -7, (select MAX(Application_Deadline) from job_market))  
and (select MAX(Application_Deadline) from job_market) 
order by Application_Deadline;

--Find jobs that are still open for applications.
select job_title,application_deadline,company_name from Job_Market
where application_deadline >= (select MAX(Application_Deadline) from job_market)
order by application_deadline;

--Find the companies that receive the highest number of job applications per posting.
select company_name, avg (number_of_applicants) as avg_applications_per_job
from Job_Market
group by company_name
order by avg_applications_per_job desc