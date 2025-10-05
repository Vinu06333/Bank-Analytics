use bank_db;
show tables;
select * from credit_debit;
select Sum(amount) as Total_transaction_amount from credit_debit;

# KPI'S

SELECT SUM(Amount) AS Total_Credit FROM credit_debit WHERE `Transaction Type` = "Credit";
SELECT SUM(Amount) AS Total_Debit FROM credit_debit WHERE `Transaction Type` = "debit";
SELECT (SUM(CASE WHEN `Transaction Type` = "Credit" THEN Amount ELSE 0 END) - SUM(CASE WHEN `Transaction Type` = "Debit" THEN Amount ELSE 0 END)) /
 SUM(CASE WHEN `Transaction Type` = "Debit" THEN Amount ELSE 0 END)* 100 AS Credit_to_Debit_Percentage FROM credit_debit;
 
SELECT (SUM(CASE WHEN `Transaction Type` = "Credit" THEN Amount ELSE 0 END) - 
SUM(CASE WHEN `Transaction Type` = "Debit" THEN Amount ELSE 0 END)) as Net_transaction_amount from Credit_debit;

#Charts

SELECT `Transaction Type`, COUNT(*) AS Transaction_Count from credit_debit group by `Transaction Type`;

select Description, count(*) as transaction_by_purpose from credit_debit group by Description order by  transaction_by_purpose desc;

SELECT DATE_FORMAT(`transaction date`, '%Y-%m') AS Month, COUNT(*) AS transaction_count FROM credit_debit GROUP BY DATE_FORMAT(`transaction date`, '%Y-%m') ORDER BY Month ASC;

SELECT `transaction method`, ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM credit_debit), 2) AS Transaction_method_percentage FROM credit_debit GROUP BY `transaction method`;

select `Bank Name`, sum(amount) Transaction_volume_by_Bank from credit_debit group by `Bank Name` order by transaction_volume_by_Bank desc; 

select Branch, sum(amount) as Total_Transaction_amount_by_bank from credit_debit group by Branch order by Total_Transaction_amount_by_bank desc;