--- INSIGHTS DE NEGOCIO

-- CATEGORÍAS MÁS RENTABLES POR CENTRO COMERCIAL
SELECT 
    shopping_mall,
    category,
    SUM(quantity * price) AS ingresos
FROM retail_sales
GROUP BY shopping_mall, category
ORDER BY shopping_mall, ingresos DESC;

-- RANKING DE CATEGORÍAS POR INGRESOS
SELECT 
    category,
    SUM(quantity * price) AS ingresos,
    RANK() OVER (ORDER BY SUM(quantity * price) DESC) AS ranking
FROM retail_sales
GROUP BY category;

-- CLIENTES DE ALTO VALOR
SELECT
    COUNT(*) AS clientes_mayor_valor
FROM (
    SELECT
        customer_id,
        SUM(quantity * price) AS gasto_total
    FROM retail_sales
    GROUP BY customer_id
)
WHERE gasto_total = (
    SELECT
        MAX(gasto_total)
    FROM (
        SELECT
            customer_id,
            SUM(quantity * price) AS gasto_total
        FROM retail_sales
        GROUP BY customer_id
    )
);

-- PERFIL ETARIO CON MAYOR GASTO
SELECT 
    CASE
        WHEN age < 25 THEN 'Joven'
        WHEN age BETWEEN 25 AND 45 THEN 'Adulto'
        ELSE 'Senior'
    END AS grupo_etario,
    SUM(quantity * price) AS ingresos
FROM retail_sales
GROUP BY grupo_etario
ORDER BY ingresos DESC;