SELECT
    'Brazil' AS País,
    customer.state AS Estado,
    COUNT(funnel.paid_date) AS "Vendas"
FROM sales.funnel AS funnel
LEFT JOIN sales.customers AS customer
    ON funnel.customer_id = customer.customer_id
WHERE funnel.paid_date >= '2021-08-01'
  AND funnel.paid_date < '2021-09-01'
GROUP BY País, Estado
ORDER BY "Vendas" DESC
LIMIT 5;