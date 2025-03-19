# SQL Job Market Analysis Project

## 📊 Project Overview
This project aims to analyze the Indian job market using SQL. The dataset consists of job postings, including details such as job titles, company names, locations, salary ranges, job types, experience levels, and more. The goal is to uncover valuable insights into the current job market trends.

## 🛠 Problem Statement
To provide actionable insights for job seekers and recruiters by analyzing job trends based on various factors like:
- Job location
- Salary range
- Job type (Full-time, Internship, Contract, etc.)
- Experience requirements
- Skills in demand
- Job portals performance

## 📥 Dataset Information
- **Dataset Name:** job_market.csv
- **Source:** Aggregated from various job portals like LinkedIn, Indeed, and Naukri
- **Number of Rows:** Approximately 20,000
- **Key Columns:** Job ID, Job Title, Company, Location, Salary Range, Experience Required, Job Type, Job Portal, Skills, and more.

## 🧑‍💻 SQL Analysis Performed
The following SQL concepts were applied for analysis:
- **Data Cleaning:** Removed null values, handled inconsistent data
- **Data Transformation:** Split salary ranges and experience into min and max values
- **Exploratory Analysis:** Identified job trends using SQL queries
- **Advanced SQL:** Applied window functions, subqueries, CTEs, and aggregate functions for deeper insights

### Key Insights Derived:
- Top job roles and industries hiring the most
- Comparison of salaries across job roles and locations
- Most in-demand skills for various experience levels
- Job portal performance analysis
- Distribution of job types (Onsite, Remote, Hybrid)

## 📊 Visualizations
To represent the findings effectively, I created a **Power BI Dashboard** with the following visuals:
- Total Jobs by Job Title
- Job Type Distribution
- Total Jobs by Location
- Total Jobs by Work Mode
- Total Jobs by Experience

## 🛠 Tools Used
- SQL Server Management Studio (SSMS)
- Power BI for visualization
- GitHub for version control

## 🚀 How to Run the Project
1. **Clone the Repository**:  
    ```bash
    git clone https://github.com/chetanmore5977/SQL-Job-Market-Analysis.git
    ```

2. **Set Up SQL Database**:  
    - Import the `job_market.csv` into your SQL Server Management Studio (SSMS).
    - Execute the SQL scripts from the `SQL_Scripts` folder.

3. **View the Dashboard**:  
    - Open the `job_market_analysis.pbix` file using Power BI Desktop.

## 🤝 Contribution
Contributions are welcome! Feel free to submit a pull request or open an issue for suggestions.

## 📧 Contact
For any questions or feedback, feel free to reach out:  
- **Name:** Chetan More  
- **LinkedIn:** https://www.linkedin.com/in/chetan-more-06b165234
- **Email:** chetanmore1122@gmail.com