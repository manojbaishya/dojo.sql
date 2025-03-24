-- Laptop vs. Mobile Viewership
-- NY Times SQL Interview Question

SELECT
  COUNT(CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_reviews,
  COUNT(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 END) AS mobile_views
FROM viewership;

-- Page With No Likes
-- Facebook SQL Interview Question

SELECT
  pages.page_id
FROM pages
LEFT JOIN page_likes
  ON page_likes.page_id = pages.page_id
WHERE page_likes.user_id IS NULL
ORDER BY
  pages.page_id ASC;
  

-- Unfinished Parts
-- Tesla SQL Interview Question

SELECT part, assembly_step FROM parts_assembly WHERE finish_date IS NULL;


-- Pharmacy Analytics (Part 1)
-- CVS Health SQL Interview Question

SELECT
  drug,
  total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
OFFSET 0 FETCH NEXT 3 ROWS ONLY;

-- Pharmacy Analytics (Part 2)
-- CVS Health SQL Interview Question

SELECT
  manufacturer,
  COUNT(drug) as drug_count,
  SUM(cogs - total_sales) AS total_loss
FROM pharmacy_sales
WHERE cogs > total_sales
GROUP BY manufacturer
ORDER BY SUM(cogs - total_sales) DESC;

-- Pharmacy Analytics (Part 3)
-- CVS Health SQL Interview Question

WITH SalesData AS (
    SELECT
      manufacturer as manf,
      ROUND(SUM(total_sales)  / 1000000.0) as Sales
    FROM pharmacy_sales
    GROUP BY manufacturer
    )
SELECT
  pharmacy_sales.manufacturer,
  FORMAT('$%s million', SalesData.Sales ) AS sale
FROM pharmacy_sales
INNER JOIN SalesData ON SalesData.manf = pharmacy_sales.manufacturer
GROUP BY pharmacy_sales.manufacturer, SalesData.Sales
ORDER BY SalesData.Sales DESC;