SELECT 
    COALESCE(matched_name, customer_name_transaction) AS customer_name, 
    customer_id,
    email,
    COUNT(transaction_id) AS total_transactions,
    SUM(amount) AS total_amount_spent,
    AVG(amount) AS average_transaction_amount,
    DATE_TRUNC('month', transaction_date) AS transaction_month,
    DATE_TRUNC('year', transaction_date) AS transaction_year 
FROM 
    consolidated_data
GROUP BY 
    customer_id, 
    customer_name, 
    email, 
    transaction_month, 
    transaction_year
ORDER BY 
    transaction_year, 
    transaction_month, 
    total_amount_spent DESC;
