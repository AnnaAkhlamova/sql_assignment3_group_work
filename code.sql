-- drop table tanny.orders;
-- CREATE OR REPLACE TABLE tanny.client (
--     id INT64,
--     name STRING,    
--     phone STRING,
--     email string,
--     country string,
--     credit_card string
-- );

-- CREATE OR REPLACE TABLE tanny.payment (
--     id INT64,
--     date STRING,
--     total_price string,
--     client_id string,
--     owner_id string
  
-- );









CREATE OR REPLACE TABLE `tanny.stage_apartments` AS
SELECT *
FROM
  `tanny.apartmentss`
WHERE
  id IS NOT NULL
  AND city IS NOT NULL
  AND adress IS NOT NULL
  AND owner_id IS NOT NULL
  AND room_num IS NOT NULL
  AND max_people_num IS NOT NULL
  AND price IS NOT NULL
  AND owner_name IS NOT NULL
  AND owner_credit_card IS NOT NULL;

select * from `tanny.stage_apartments`;





CREATE OR REPLACE TABLE `tanny.stage_clients` AS
SELECT
  id,
  name,
  phone,

  country,
  credit_card
FROM
  `tanny.clients`
WHERE
  id IS NOT NULL
  AND phone IS NOT NULL
  AND country IS NOT NULL
  AND credit_card IS NOT NULL
  AND name IS NOT NULL;


select * from `tanny.apartments`;




CREATE OR REPLACE TABLE `tanny.stage_payments` AS
SELECT
  id,
  date,
  total_price,
  client_id,
  owner_id
FROM
  `tanny.payments`
WHERE
  id IS NOT NULL
  and date is not null
  AND client_id IS NOT NULL
  AND owner_id IS NOT NULL
  AND total_price IS NOT NULL;



SELECT COUNT(*) FROM `tanny.stage_owners`;
SELECT COUNT(*) FROM `tanny.stage_clients`;
SELECT COUNT(*) FROM `tanny.stage_apartments`;
SELECT COUNT(*) FROM `tanny.stage_payments`;




select * from tanny.stage_apartments;
CREATE OR REPLACE TABLE tanny.dim_owners AS
SELECT DISTINCT
    owner_id AS id,
    owner_name AS name,
    owner_credit_card as credit_card
FROM tanny.stage_apartments;


CREATE OR REPLACE TABLE tanny.dim_apartments AS
SELECT
    id,
    city,
    adress,
    owner_id,
    room_num,
    max_people_num,
    price
FROM tanny.stage_apartments;

CREATE OR REPLACE TABLE tanny.dim_clients AS
SELECT
    id AS client_id,
    name,
    phone,
    country,
    credit_card
FROM tanny.stage_clients;





CREATE OR REPLACE TABLE tanny.fact_orders AS
SELECT
    p.id AS order_id,
    p.client_id, 
    p.owner_id,
    a.id AS apartment_id, 
    DATE(p.date) AS date_id,
    p.total_price, 
    a.max_people_num AS num_guests, 
    a.room_num 
FROM tanny.stage_payments AS p
JOIN tanny.dim_apartments AS a
    ON p.owner_id = a.owner_id
JOIN tanny.dim_owners AS o
    ON p.owner_id = o.id
JOIN tanny.dim_clients AS c
    ON p.client_id = c.client_id;


select * from tanny.fact_orders;





CREATE OR REPLACE TABLE stat_by_owner as (
  SELECT
    o.name AS owner_name,
    a.city AS city,
    COUNT(f.order_id) AS num_orders,
    SUM(f.total_price) AS total_revenue,
    AVG(f.num_guests) AS avg_guests
FROM tanny.fact_orders AS f
JOIN tanny.dim_owners AS o
    ON f.owner_id = o.id
JOIN tanny.dim_apartments AS a
    ON f.apartment_id = a.id
GROUP BY
    o.name,
    a.city
ORDER BY
    total_revenue DESC);



