-- Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers". "id" = "addresses"."customer_id";
-- Get all orders and their line items
-- (orders, quantity and product).
SELECT "orders", "quantity", "description" FROM "orders"
JOIN "line_items" ON "orders". "id" = "line_items"."order_id"
JOIN "products" ON "line_items". "product_id" = "products" . "id";
-- Which warehouses have cheetos?
SELECT "description", "warehouse"
FROM "products"
JOIN "warehouse_product" ON "products". "id" = "warehouse_product" . "product_id"
JOIN "warehouse" ON "warehouse_product" . "warehouse_id" = "warehouse" ."id"
WHERE "product_id" = '5';

-- Which warehouses have diet pepsi?
SELECT "description", "warehouse"
FROM "products"
JOIN "warehouse_product" ON "products". "id" = "warehouse_product" . "product_id"
JOIN "warehouse" ON "warehouse_product" . "warehouse_id" = "warehouse" ."id"
WHERE "product_id" = '6';

-- Get the number of orders for each customer.
-- NOTE:
-- It is OK
-- if those without orders are not included in results.
SELECT "customers"."first_name", "customers"."last_name", COUNT(*)
FROM "customers"
JOIN "addresses" ON "customers". "id" = "addresses"."customer_id"
JOIN "orders" ON "addresses" . "id" = "orders" . "address_id"
JOIN "line_items" ON "orders" . "id" = "line_items" . "order_id"
GROUP BY "customers"."first_name", "customers"."last_name";
-- How many customers do we have?
SELECT COUNT(*) FROM "customers"
-- How many products do we carry?
SELECT COUNT(*) FROM "products"
-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand")FROM "warehouse_product"
JOIN "products" ON "warehouse_product". "product_id" = "products". "id"
WHERE "products"."id" = '6';
