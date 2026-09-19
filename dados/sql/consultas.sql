-- 1. Faturamento Total e Total de Produtos Vendidos
-- Objetivo: Entender o volume geral de vendas do negócio.
SELECT 
    SUM(Valor_Total) AS Faturamento_Total,
    SUM(Quantidade) AS Total_Produtos_Vendidos
FROM dados.vendas;

-- 2. Top 5 Produtos Mais Vendidos por Faturamento
-- Objetivo: Identificar quais produtos trazem mais receita para a empresa.
SELECT 
    Produto,
    SUM(Valor_Total) AS Faturamento_Por_Produto
FROM dados.vendas
GROUP BY Produto
ORDER BY Faturamento_Por_Produto DESC
LIMIT 5;

-- 3. Desempenho de Vendas por Categoria de Produto
-- Objetivo: Visão macro de quais categorias performam melhor.
SELECT 
    Categoria,
    SUM(Valor_Total) AS Faturamento_Categoria,
    AVG(Preco_Unitario) AS Preco_Medio
FROM dados.vendas
GROUP BY Categoria
ORDER BY Faturamento_Categoria DESC;

-- 4. Ranking de Vendedores (Top 3)
-- Objetivo: Identificar os vendedores que mais geraram receita.
SELECT 
    Vendedor,
    SUM(Valor_Total) AS Total_Vendido
FROM dados.vendas
GROUP BY Vendedor
ORDER BY Total_Vendido DESC
LIMIT 3;

-- 5. Evolução Mensal do Faturamento
-- Objetivo: Identificar tendências, sazonalidade e crescimento ao longo do tempo.
SELECT 
    DATE_TRUNC('month', Data) AS Mes, -- Nota: a função pode variar dependendo do banco (ex: STRFTIME para SQLite)
    SUM(Valor_Total) AS Faturamento_Mensal
FROM dados.vendas
GROUP BY Mes
ORDER BY Mes;
