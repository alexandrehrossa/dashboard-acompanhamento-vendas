SELECT
    EXTRACT('dow' FROM visit_page_date) AS dia_semana,
    CASE
        WHEN EXTRACT('dow' FROM visit_page_date) = 0 THEN 'Dom'
        WHEN EXTRACT('dow' FROM visit_page_date) = 1 THEN 'Seg'
        WHEN EXTRACT('dow' FROM visit_page_date) = 2 THEN 'Ter'
        WHEN EXTRACT('dow' FROM visit_page_date) = 3 THEN 'Qua'
        WHEN EXTRACT('dow' FROM visit_page_date) = 4 THEN 'Qui'
        WHEN EXTRACT('dow' FROM visit_page_date) = 5 THEN 'Sex'
        WHEN EXTRACT('dow' FROM visit_page_date) = 6 THEN 'Sáb'
        ELSE NULL
    END AS "Dia da Semana",
    COUNT(*) AS "Visitas"
FROM sales.funnel
WHERE visit_page_date >= '2021-08-01'
  AND visit_page_date < '2021-09-01'
GROUP BY dia_semana
ORDER BY dia_semana;