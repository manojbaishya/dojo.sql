SELECT
    oi.product_id,
    orev.review_score
FROM order_items oi
INNER JOIN order_reviews orev ON orev.order_id = oi.order_id
ORDER BY oi.price DESC
LIMIT 100 OFFSET 0;
