SELECT product_id AS productId,
    SUM(weight * quantity) AS totalWeight
FROM orders
    JOIN route_segments USING(order_id)
    JOIN orders_products USING(order_id)
    JOIN products USING(product_id)
WHERE customer_id = 32
    AND DATE(segment_end_time) = "2024-02-13"
    AND segment_type = "STOP"
GROUP by product_id
ORDER BY totalWeight
INTO OUTFILE '/var/lib/mysql-files/Denis_Kolmykov.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
