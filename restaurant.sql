-- Creating tables in BigQuery and establishing schema and primary keys
CREATE TABLE orders (
    row_id INT64 NOT NULL,
    order_id STRING NOT NULL,
    created_at DATETIME NOT NULL,
    item_id STRING NOT NULL,
    quantity INT64 NOT NULL,
    cust_id INT64 NOT NULL,
    delivery BOOL NOT NULL,
    add_id INT64 NOT NULL,
    PRIMARY KEY (row_id) NOT ENFORCED
);

CREATE TABLE customers (
    cust_id INT64 NOT NULL,
    cust_firstname STRING NOT NULL,
    cust_lastname STRING NOT NULL,
    PRIMARY KEY (cust_id) NOT ENFORCED
);

CREATE TABLE address (
    add_id INT64 NOT NULL,
    delivery_address1 STRING NOT NULL,
    delivery_address2 STRING,
    delivery_city STRING NOT NULL,
    delivery_zipcode STRING NOT NULL,
    PRIMARY KEY (add_id) NOT ENFORCED
);

CREATE TABLE item (
    item_id STRING NOT NULL,
    sku STRING NOT NULL,
    item_name STRING NOT NULL,
    item_cat STRING NOT NULL,
    item_size STRING NOT NULL,
    item_price NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (item_id) NOT ENFORCED
);

CREATE TABLE ingredient (
    ing_id STRING NOT NULL,
    ing_name STRING NOT NULL,
    ing_weight INT64 NOT NULL,
    ing_meas STRING NOT NULL,
    ing_price NUMERIC(5, 2) NOT NULL,
    PRIMARY KEY (ing_id) NOT ENFORCED
);

CREATE TABLE recipe (
    row_id INT64 NOT NULL,
    recipe_id STRING NOT NULL,
    ing_id STRING NOT NULL,
    quantity INT64 NOT NULL,
    PRIMARY KEY (row_id) NOT ENFORCED
);

CREATE TABLE inventory (
    inv_id INT64 NOT NULL,
    item_id STRING NOT NULL,
    quantity INT64 NOT NULL,
    PRIMARY KEY (inv_id) NOT ENFORCED
);

CREATE TABLE rota (
    row_id INT64 NOT NULL,
    rota_id STRING NOT NULL,
    date DATETIME NOT NULL,
    shift_id STRING NOT NULL,
    staff_id STRING NOT NULL,
    PRIMARY KEY (row_id) NOT ENFORCED
);

CREATE TABLE shift (
    shift_id STRING NOT NULL,
    day_of_week STRING NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    PRIMARY KEY (shift_id) NOT ENFORCED
);

CREATE TABLE staff (
    staff_id STRING NOT NULL,
    first_name STRING NOT NULL,
    last_name STRING NOT NULL,
    position STRING NOT NULL,
    hourly_rate NUMERIC(5, 2) NOT NULL,
    PRIMARY KEY (staff_id) NOT ENFORCED
);

-- Querying to select necessary columns by combining tables using Joins
SELECT 
  o.order_id,
  i.item_price,
  o.quantity,
  i.item_cat,
  i.item_name,
  o.created_at,
  a.delivery_address1,
  a.delivery_address2,
  a.delivery_city,
  a.delivery_zipcode,
  o.delivery

FROM restaurant_project.orders_table as o
LEFT JOIN restaurant_project.item_table i on o.item_id=i.item_id
LEFT JOIN restaurant_project.address_table a on o.add_id=a.add_id


