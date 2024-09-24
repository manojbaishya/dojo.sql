/* -------------------------------------------------------------------------- */
/*                               Product Weight                               */
/* -------------------------------------------------------------------------- */

SELECT product_category_name,
    product_weight_g
FROM products
WHERE product_category_name IS NOT NULL
ORDER BY product_id ASC
LIMIT 100 OFFSET 0;

/* -------------------------------------------------------------------------- */
/*                             Category Wise Sales                            */
/* -------------------------------------------------------------------------- */

SELECT -- c.customer_unique_id,
    -- GROUP_CONCAT(prod.product_id),
    GROUP_CONCAT(trns.product_category_name_english),
    SUM(oi.price) AS bill_value
FROM orders o
    INNER JOIN customers c on c.customer_id = o.customer_id
    INNER JOIN order_items oi ON oi.order_id = o.order_id
    INNER JOIN products prod ON prod.product_id = oi.product_id
    INNER JOIN product_category_name_translation trns ON trns.product_category_name = prod.product_category_name
GROUP BY c.customer_unique_id
ORDER BY bill_value DESC
LIMIT 10 OFFSET 0;

