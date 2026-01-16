USE BANKING;

# Checking for all values
SELECT * FROM FINANCIAL;

# Calculating the total Loan applications
SELECT COUNT(id) AS "Total Loan Applications" FROM FINANCIAL;

# Calculating the Month to Date Loan Applications
SELECT COUNT(id) AS "Last Month Total Applications" FROM FINANCIAL
WHERE MONTH(issue_date) = 12;

# Calculating the Month to Month Loan Applications
SELECT
  MONTHNAME(issue_date) AS "Month",
  COUNT(*) AS "Total Loans"
FROM FINANCIAL
GROUP BY MONTHNAME(issue_date)
ORDER BY COUNT(*) DESC;

# Calculating the Total Funded Amount
SELECT SUM(loan_amount) AS "Total Funded Amount" FROM FINANCIAL;

# Calculating the Month to Date Total Funded Amount
SELECT SUM(loan_amount) AS "MTD Total Funded Amount" FROM FINANCIAL
WHERE MONTH(issue_date) = 12;
      
# Calculating the Month over Month Total Funded Amount
SELECT
  MONTHNAME(issue_date) AS "Month",
  SUM(loan_amount) AS "Total Loan Amount"
FROM FINANCIAL
GROUP BY MONTHNAME(issue_date)
ORDER BY SUM(loan_amount) DESC;
      
# Calculating the Total Recieved Amount
SELECT SUM(total_payment) AS "Total Recieved Amount" FROM FINANCIAL;     

# Calculating the Last Month Total Recieved Amount
SELECT SUM(total_payment) AS "MTD Total Recieved Amount" FROM FINANCIAL
WHERE MONTH(issue_date) = 12;
               
# Calculating the Month over Month Total Recieved Amount
SELECT
  MONTHNAME(issue_date) AS "Month",
  SUM(loan_amount) AS "Total Recieved Amount"
FROM FINANCIAL
GROUP BY MONTHNAME(issue_date)
ORDER BY SUM(total_payment) DESC; 
      
# Calculating the Average Interest Rate
SELECT AVG(int_rate) AS "AVERAGE INTEREST RATE" FROM FINANCIAL;

# Calculating the Last Month Average Interest Rate
SELECT AVG(int_rate) AS "MTD Average Interest Rate" FROM FINANCIAL
WHERE MONTH(issue_date) = 12;
      
# Calculating the PMTD Average Interest Rate
SELECT
  MONTHNAME(issue_date) AS "Month",
  AVG(int_rate) AS "Average Interest rate"
FROM FINANCIAL
GROUP BY MONTHNAME(issue_date)
ORDER BY AVG(int_rate) DESC; 

# Calculating the Average Debt-to-Income Ratio
SELECT AVG(dti) AS "Average Debt-to-Income Ratio" FROM FINANCIAL;

# Calculating the MTD Average DTI
SELECT AVG(dti) AS "MTD Average DTI" FROM FINANCIAL
WHERE MONTH(issue_date) = 12;
      
# Calculating the Month over Month Average DTI
SELECT
  MONTHNAME(issue_date) AS "Month",
  AVG(dti) AS "Average DTI"
FROM FINANCIAL
GROUP BY MONTHNAME(issue_date)
ORDER BY AVG(dti) DESC;
      
# Calculating the Good Loan Percentage
SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / COUNT(id)
AS "Good Loan Percentage" FROM FINANCIAL;

# Calculating the Total Number of Good Loan Applications
SELECT COUNT(id) AS "No. of Good Loan Applications" FROM FINANCIAL
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

# Calculating the Total Good Loan Amount
SELECT SUM(loan_amount) AS "Total Good Loan Amount" FROM FINANCIAL
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

# Calculating the Total Good Loan Amount Recieved
SELECT SUM(total_payment) AS "Total Good Loan Amount Recieved" FROM FINANCIAL
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

# Calculating the Bad Loan Percentage
SELECT 
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id)
AS "Bad Loan Percentage" FROM FINANCIAL;

# Calculating the Total Number of Bad Loan Applications
SELECT COUNT(id) AS "No. of Bad Loan Applications" FROM FINANCIAL
WHERE loan_status = 'Charged Off';

# Calculating the Total Bad Loan Amount
SELECT SUM(loan_amount) AS "Total Bad Loan Amount" FROM FINANCIAL
WHERE loan_status = 'Charged Off';

# Calculating the Total Bad Loan Amount Recieved
SELECT SUM(total_payment) AS "Total Bad Loan Amount Recieved" FROM FINANCIAL
WHERE loan_status = 'Charged Off';

# Calculating the Loan Status
SELECT
	loan_status AS "Loan Status",
	COUNT(id) AS "No. of Loans",
	SUM(total_payment) AS "Total Amount Recieved",
	SUM(loan_amount) AS "Total Loan Amount",
	AVG(int_rate * 100) AS "Interest Rate",
	AVG(dti * 100) AS "Debt-Income Ratio"
FROM FINANCIAL
GROUP BY loan_status;

# Calculating the MTD Loan Status 
SELECT 
	loan_status AS "Loan Status", 
	SUM(total_payment) AS "MTD Total Amount Received", 
	SUM(loan_amount) AS "MTD Total Loan Amount",
    AVG(int_rate * 100) AS "Interest Rate",
	AVG(dti * 100) AS "Debt-Income Ratio"
FROM FINANCIAL
WHERE MONTH(issue_date) = 12
GROUP BY loan_status;

# Monthly Bank Loan Report
SELECT 
	MONTHNAME(issue_date) AS "Month", 
	COUNT(*) AS "No. of Loan Applications",
	SUM(loan_amount) AS "Total Loan Amount",
	SUM(total_payment) AS "Total Amount Recieved",
    AVG(int_rate * 100) AS "Interest Rate",
	AVG(dti * 100) AS "Debt-Income Ratio"
FROM FINANCIAL
GROUP BY MONTHNAME(issue_date)
ORDER BY COUNT(*) DESC;

# State-Wise Bank Loan Report
SELECT 
	address_state AS "State", 
	COUNT(id) AS "Total Loan Applications",
	SUM(loan_amount) AS "Total Loan Amount",
	SUM(total_payment) AS "Total Amount Received"
FROM FINANCIAL
GROUP BY address_state
ORDER BY address_state;

# Term-Wise Bank Loan Report
SELECT 
	term AS "Term", 
	COUNT(id) AS "Total Loan Applications",
	SUM(loan_amount) AS "Total Loan Amount",
	SUM(total_payment) AS "Total Amount Received"
FROM FINANCIAL
GROUP BY term
ORDER BY term;

# Employee Length-Wise Loan Report
SELECT 
	emp_length AS "Employee Length", 
	COUNT(id) AS "Total Loan Applications",
	SUM(loan_amount) AS "Total Loan Amount",
	SUM(total_payment) AS "Total Amount Received"
FROM FINANCIAL
GROUP BY emp_length
ORDER BY emp_length;

# Purpose-Wise Loan Report
SELECT 
	purpose AS "Purpose", 
	COUNT(id) AS "Total Loan Applications",
	SUM(loan_amount) AS "Total Loan Amount",
	SUM(total_payment) AS "Total Amount Received"
FROM FINANCIAL
GROUP BY purpose
ORDER BY purpose;

# Bank Loan Report Based on the Home Ownership
SELECT 
	home_ownership AS "Home Ownership Status", 
	COUNT(id) AS "Total Loan Applications",
	SUM(loan_amount) AS "Total Loan Amount",
	SUM(total_payment) AS "Total Amount Received"
FROM FINANCIAL
GROUP BY home_ownership
ORDER BY home_ownership;

