-- Work Mode & Location Analysis
use JobMarketDB
select * from Job_Market

--Count the Number of Jobs in Each City
select job_location, count(*) as total_job
from job_market
group by job_location
order by total_job desc

--Find Cities with the Highest-Paying Jobs
select job_location, max (maxsalary) as highest_paying
from Job_Market
group by job_location
order by highest_paying desc

--Compare salaries between Remote, Hybrid, and Onsite jobs.
select Work_mode,
AVG(maxsalary) as average_salary,min(maxsalary) as lowest_salary,max(maxsalary) as highest_salary
from Job_Market
group by work_mode
order by average_salary desc;

--Find which job titles are most commonly offered as remote roles.
select job_title, count(*) as remote_job_count
from Job_Market
where work_mode='remote'
group by job_title
order by remote_job_count desc;