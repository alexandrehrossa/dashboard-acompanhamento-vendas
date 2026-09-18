SELECT
    store.store_name AS Loja,
    COUNT(funnel.paid_date) AS "Vendas"
FROM sales.funnel AS funnel
LEFT JOIN sales.stores AS store
    ON funnel.store_id = store.store_id
WHERE funnel.paid_date >= '2021-08-01'
  AND funnel.paid_date < '2021-09-01'
GROUP BY Loja
ORDER BY "Vendas" DESC
LIMIT 5;