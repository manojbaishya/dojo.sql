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

