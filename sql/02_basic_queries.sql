--- ANALISIS DESCRIPTIVO

-- NÚMERO DE VENTALES TOTALES
SELECT COUNT(*) AS total_ventas
FROM retail_sales;

-- INGRESOS TOTALES
SELECT 
    SUM(quantity * price) AS ingresos_totales
FROM retail_sales;

-- VENTAS POR CATEGORÍA
SELECT 
    category,
    SUM(quantity * price) AS ingresos
FROM retail_sales
GROUP BY category
ORDER BY ingresos DESC;

-- VENTAS POR GÉNERO
SELECT 
    gender,
    SUM(quantity * price) AS ingresos
FROM retail_sales
GROUP BY gender;

-- MÉTODOS DE PAGO MÁS UTILIZADOS
SELECT 
    payment_method,
    COUNT(*) AS total_transacciones
FROM retail_sales
GROUP BY payment_method
ORDER BY total_transacciones DESC;

--- ANALISIS DE CLIENTES Y TIEMPO

-- TICKET PROMEDIO
SELECT 
    AVG(quantity * price) AS ticket_promedio
FROM retail_sales;

-- INGRESOS POR CENTRO COMERCIAL
SELECT 
    shopping_mall,
    SUM(quantity * price) AS ingresos
FROM retail_sales
GROUP BY shopping_mall
ORDER BY ingresos DESC;

-- INGRESOS POR MES
SELECT
    strftime(
        '%Y-%m',
        substr(invoice_date, 7, 4) || '-' ||
        substr(invoice_date, 4, 2) || '-' ||
        substr(invoice_date, 1, 2)
    ) AS mes,
    SUM(quantity * price) AS ingresos
FROM retail_sales
GROUP BY mes
ORDER BY ingresos DESC;
