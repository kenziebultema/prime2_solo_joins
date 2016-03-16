-- Get all customers and their addresses.
SELECT *
FROM customers
INNER JOIN addresses
ON addresses.customer_id = customers.id;

-- Get all orders and their line items.
SELECT *
FROM orders
INNER JOIN line_items
ON line_items.order_id = orders.id;

-- Which warehouses have cheetos?
SELECT W.warehouse
FROM warehouse W,(
	SELECT A.warehouse_id
	FROM warehouse_product A, (
		SELECT P.id
		FROM products P
		WHERE P.description = 'cheetos') B
	WHERE A.product_id = B.id) C
WHERE W.id = C.warehouse_id;

-- Which warehouses have diet pepsi?
SELECT W.warehouse
FROM warehouse W, (
	SELECT C.warehouse_id
	FROM warehouse_product C, (
		SELECT P.id
		FROM products P
		WHERE P.description = 'diet pepsi' ) Z
	WHERE Z.id = C.product_id ) Y
WHERE W.id = Y.warehouse_id;

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.


-- How many customers do we have?
SELECT COUNT(id) FROM customers;

-- How many products do we carry?
SELECT COUNT(id) FROM products;

-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM(O.on_hand)
FROM warehouse_product O, (
	SELECT P.id
	FROM products P
	WHERE P.description = 'diet pepsi' ) C
WHERE O.product_id = C.id;
