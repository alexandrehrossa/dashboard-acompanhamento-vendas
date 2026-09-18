SELECT
    product.brand AS Marca,
    COUNT(funnel.paid_date) AS "Vendas"
FROM sales.funnel AS funnel
LEFT JOIN sales.products AS product
    ON funnel.product_id = product.product_id
WHERE funnel.paid_date >= '2021-08-01'
  AND funnel.paid_date < '2021-09-01'
GROUP BY Marca
ORDER BY "Vendas" DESC
LIMIT 5;