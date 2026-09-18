WITH leads AS (
    SELECT
        DATE_TRUNC('month', visit_page_date)::date AS visit_page_month,
        COUNT(*) AS visit_page_count
    FROM sales.funnel
    GROUP BY visit_page_month
),

payments AS (
    SELECT
        DATE_TRUNC('month', funnel.paid_date)::date AS paid_month,
        COUNT(funnel.paid_date) AS paid_count,
        SUM(product.price * (1 + funnel.discount)) AS receita
    FROM sales.funnel AS funnel
    LEFT JOIN sales.products AS product
        ON funnel.product_id = product.product_id
    WHERE funnel.paid_date IS NOT NULL
    GROUP BY paid_month
)

SELECT
    leads.visit_page_month AS "Mês",
    leads.visit_page_count AS "Leads",
    payments.paid_count AS "Vendas",
    (payments.receita / 1000) AS "Receita (R$ mil)"
FROM leads
LEFT JOIN payments
    ON leads.visit_page_month = payments.paid_month
ORDER BY leads.visit_page_month;