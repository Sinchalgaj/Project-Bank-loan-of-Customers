create database Project ;

# KPI 1 - Year wise Laon Amount Stats

select
year(issue_d) as Year,
SUM(Loan_amnt) AS 'Total Loan Amount'
from finance_1
group by year(issue_d)
order by year(issue_d) ;

set sql_mode = 0;
# KPI 2 - Grade and sub grade wise revol_bal

select
f.grade,
f.sub_grade,
revol_bal as 'Revovling Balance'
from finance_1 f inner join finance_2 g on f.id = g.id
group by f.sub_grade
order by f.grade, f.sub_grade;


# KPI 3 - Total Payment for Verified Status Vs Total Payment for Non Verified Status

select
verification_status,
Sum(total_pymnt) as 'Total Payment'
from finance_1 f inner join finance_2 g on f.id = g.id
group by verification_status;


#KPI 4 - State wise and month wise loan status

SELECT
addr_state as State,
MONTH(issue_d) AS Month,
COUNT(*) AS TotalLoans,
SUM(CASE WHEN loan_status = 'Fully Paid' THEN 1 ELSE 0 END) AS Fully_Paid,
SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 ELSE 0 END) AS Charged_Off,
SUM(CASE WHEN loan_status = 'Current' THEN 1 ELSE 0 END) AS Current
FROM finance_1 
GROUP BY State, MONTH(issue_d);


#KPI 5 - Home ownership Vs last payment date stats

select
home_ownership as 'Home Onwership',
count(last_pymnt_d) as 'Last Payment Date',
Max(last_pymnt_d) as 'Last Payment Date'
from finance_1 f inner join finance_2 g on f.id = g.id
group by home_ownership;