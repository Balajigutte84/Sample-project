-- bank_loan-project PROJECT IN MYSQL
SELECT * FROM bank_loan_project.df1 LIMIT 39717;
select* from bank_loan_project.df2 LIMIT 39717;
select count(*) from df1;
-- Total loan amount
SELECT SUM(loan_amnt) FROM df1;
-- Average interest rate
SELECT AVG(Interest_rate) FROM df1;
-- Maximum DTI
SELECT MAX(DTI) FROM df1;
-- Minimum funded amount
SELECT MIN(funded_amnt) FROM df1;
-- Loan count by grade
SELECT Grade, COUNT(*) FROM df1 GROUP BY Grade;
-- Loan count by status
SELECT loan_status, COUNT(*) FROM df1 GROUP BY loan_status;
-- Loan amount by state
SELECT addr_state, SUM(loan_amnt) FROM df1 GROUP BY addr_state;
-- Loan count by purpose
SELECT Purpose_of_Loan, COUNT(*) FROM df1 GROUP BY Purpose_of_Loan;
-- Loans with interest rate > 15%
SELECT * FROM df1 WHERE Interest_rate > 0.15;
-- Loans with DTI > 20
SELECT * FROM df1 WHERE DTI > 20;
-- Flag loans as 'High Risk' if interest rate > 15%
SELECT id, Interest_rate, CASE WHEN Interest_rate > 0.15 THEN 'High Risk' ELSE 'Normal' END AS risk_flag FROM df1;
-- Loans with recoveries > 0
SELECT * FROM df2 WHERE recoveries > 0;
-- Recovery ratio per loan
SELECT id, recoveries / total_rec_prncp AS recovery_ratio FROM df2;
-- Loans marked as 'Fully Paid'
SELECT * FROM df1 WHERE loan_status = 'Fully Paid';
-- Loans taken by verified borrowers
SELECT * FROM df1 WHERE verification_status = 'Verified';
-- Total payment per loan
SELECT id, total_pymnt FROM df2;
-- Total principal received per loan
SELECT id, total_rec_prncp FROM df2;
-- Total interest received per loan
SELECT id, total_rec_int FROM df2;
-- Extract year from issue date
SELECT YEAR(Issue_Date) FROM df1;
-- Extract month from issue date
SELECT MONTH(Issue_Date) FROM df1;
-- Uppercase state codes
SELECT UPPER(addr_state) FROM df1;
-- Concatenate grade and sub-grade
SELECT CONCAT(Grade, '-', sub_grade) AS full_grade FROM df1;
-- Replace underscores in purpose
SELECT REPLACE(Purpose_of_Loan, '_', ' ') FROM df1;
-- Flag loans with high interest and high recoveries
SELECT IF(Interest_rate > 0.15 AND recoveries > 100, 'High Risk + Recovery', 'Standard') FROM df1 JOIN df2 USING(id);
-- Format issue date
SELECT DATE_FORMAT(Issue_Date, '%d-%b-%Y') FROM df1;
-- Total loan amount for Grade A
SELECT SUM(loan_amnt) FROM df1 WHERE Grade = 'A';	
-- Categorize DTI for loans with loan_amnt > 10000
SELECT CASE
  WHEN DTI < 10 THEN 'Low'
  WHEN DTI < 20 THEN 'Medium'
  ELSE 'High'
END AS dti_category FROM df1 WHERE loan_amnt > 10000;

-- Loans with interest rate > 15% and revol_util > 0.8
SELECT df1.id, df1.Interest_rate, df2.revol_util
FROM df1
JOIN df2 ON df1.id = df2.id
WHERE df1.Interest_rate > 0.15 AND df2.revol_util > 0.8;

-- Show all loans, even if no payment info exists
SELECT df1.id, df1.loan_amnt, df2.total_pymnt
FROM df1
LEFT JOIN df2 ON df1.id = df2.id;

-- Average loan amount
SELECT AVG(loan_amnt) AS avg_loan_amount FROM df1;
-- Join df1 and df2 to get loans that have corresponding payment records
SELECT df1.id, df1.loan_amnt, df2.total_pymnt, df2.total_rec_int
FROM df1
INNER JOIN df2 ON df1.id = df2.id;
-- KPI: Total loan issued vs total payment received
SELECT
  SUM(df1.loan_amnt) AS total_loan_issued,
  SUM(df2.total_pymnt) AS total_payment_received
FROM df1
JOIN df2 ON df1.id = df2.id;
-- KPI: Demand analysis by loan purpose
SELECT Purpose_of_Loan, SUM(loan_amnt) AS total_issued
FROM df1
GROUP BY Purpose_of_Loan
ORDER BY total_issued DESC;
------ inner join------
SELECT *
FROM df1
INNER JOIN df2
ON df1.id = df2.id;
---------- left join ------------
SELECT *
FROM df1
LEFT JOIN df2
ON df1.id = df2.id;
-------- right join -----
SELECT *
FROM df1
RIGHT JOIN df2
ON df1.id = df2.id;
-------- full outer join -------------
SELECT *
FROM df1
LEFT JOIN df2 ON df1.id = df2.id

UNION

SELECT *
FROM df1
RIGHT JOIN df2 ON df1.id = df2.id;
-------------------------------------------------------------- -


