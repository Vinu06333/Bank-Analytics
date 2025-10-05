use banking_data;
select * from bank_loans_data;
-- 1. Total loan amount
SELECT SUM(loan_amount) AS total_loan_amount FROM bank_loans_data;
-- 2. Total funded amount
SELECT SUM(funded_amount) AS total_loan_amount_funded FROM bank_loans_data;
-- 3. Total interest amount
SELECT SUM(total_rec_int) AS total_interest_received FROM bank_loans_data;
-- 4. Total principal
SELECT SUM(total_rec_prncp) AS total_principal_received FROM bank_loans_data;
-- 5. Total  payment
SELECT SUM(total_pymnt) AS total_payment_received FROM bank_loans_data;
-- 6.States with loan activity
SELECT state_name, COUNT(DISTINCT client_id) AS client_count FROM bank_loans_data GROUP BY state_name ORDER BY client_count DESC;
-- 7. Loan category wise 
SELECT CASE WHEN loan_status = 'Active Loan' THEN 'Active'
    WHEN loan_status IN ('NPA', 'Write Off') THEN 'Default'
    WHEN loan_status IN ('Fully Paid', 'Paid Off', 'Cancelled', 'Insurance Paid Off', 'Net-Off', 'Transffered') THEN 'Closed'
  END AS loan_category, COUNT(DISTINCT client_id) AS client_count FROM bank_loans_data GROUP BY loan_category;
-- 8. Monthly Disbursement
SELECT MONTHNAME(disbursement_date) AS disbursement_month,
  SUM(funded_amount) AS total_disbursed FROM bank_loans_data GROUP BY MONTH(disbursement_date), MONTHNAME(disbursement_date)
ORDER BY MONTH(disbursement_date);
-- 9. age group wise loan
SELECT age_group,
  SUM(loan_amount) AS total_amount FROM bank_loans_data GROUP BY age_group;
-- 10. branch wise performance
SELECT branch_name,
  SUM(total_rec_int) AS total_interest, SUM(total_fees) AS total_fees, SUM(total_rec_prncp + total_rec_int + total_fees) AS total_revenue FROM bank_loans_data GROUP BY branch_name;
-- 11.Product Group-Wise Loan
SELECT product_code, SUM(loan_amount) AS total_loan_amount FROM bank_loans_data GROUP BY product_code;



