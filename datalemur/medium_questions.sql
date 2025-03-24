-- Swapped Food Delivery
-- Zomato SQL Interview Question


WITH vars AS (
    SELECT
        COUNT(order_id) AS totalorders
    FROM orders
)

SELECT
    CASE
        WHEN orders.order_id % 2 = 1 AND orders.order_id != vars.totalorders THEN orders.order_id + 1
        WHEN orders.order_id % 2 = 0 AND orders.order_id != vars.totalorders THEN orders.order_id - 1
        ELSE orders.order_id
    END as corrected_order_id,
    item
FROM orders
CROSS JOIN vars
ORDER BY corrected_order_id ASC;