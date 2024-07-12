/** OLIST QUERY **/

-- FINDING NULL AND DUPLICATE VALUES IN THE DATASET

-- 1) Checking for null AND duplicate values in the each table in Olist dataset

-- Ai) CUSTOMERS TABLE NULL VALUES**/

SELECT 'customer_id' AS column_name, COUNT(*) AS number_of_nulls
FROM customers
WHERE   customer_id IS NULL

UNION

SELECT 'customer_unique_id', COUNT(*)
FROM customers
where   customer_unique_id IS NULL

UNION

SELECT 'customer_zip_code_prefix', COUNT(*)
FROM customers
WHERE   customer_zip_code_prefix IS NULL
UNION

SELECT 'customer_city', COUNT(*)
FROM customers
WHERE   customer_city IS NULL

UNION

SELECT 'customer_state', COUNT(*)
FROM customers
WHERE   customer_state IS NULL;

-- Aii) CUSTOMERS TABLE DUPICATES VALUES

SELECT  customer_id, customer_unique_id, customer_zip_code_prefix,
        customer_city,
        customer_state,
        COUNT(*) AS number_of_duplicates
FROM customers
GROUP BY    customer_id, customer_unique_id, customer_zip_code_prefix,
            customer_city, customer_state
HAVING COUNT(*) > 1;

/** No duplicates and nulls in customers table **/

-- Bi) GEOLOCATION TABLE NULL VALUES

SELECT 'geolocation_zip_code_prefix' AS column_name, COUNT(*) AS number_of_nulls
FROM geolocation
WHERE   geolocation_zip_code_prefix IS NULL

UNION

SELECT 'geolocation_lat', COUNT(*)
FROM geolocation
WHERE   geolocation_lat IS NULL

UNION 

SELECT 'geolocation_lng', COUNT(*)
FROM geolocation
WHERE   geolocation_lng IS NULL 

UNION 

SELECT 'geolocation_city', COUNT(*)
FROM geolocation
WHERE   geolocation_city IS NULL

UNION 

SELECT 'geolocation_state', COUNT(*)
FROM geolocation
WHERE   geolocation_state IS NULL;

/** No nulls in geolocation **/

-- Bii) GEOLOCATION TABLE DUPLICATE VALUES

SELECT  geolocation_zip_code_prefix, geolocation_lat,
        geolocation_lng, geolocation_city, geolocation_state,
        COUNT(*) AS number_of_duplicates
FROM geolocation
GROUP BY    geolocation_zip_code_prefix, geolocation_lat,
            geolocation_lng, geolocation_city, geolocation_state
HAVING COUNT(*) > 1;

-- Since there are numerous duplicates, we can remove by 

-- biii) Removing geolocation duplicates and storing it as a "CTE" (new_geolocation)

WITH new_geolocation AS 
(
SELECT  DISTINCT geolocation_zip_code_prefix, geolocation_lat,
        geolocation_lng, geolocation_city,
        geolocation_state
FROM geolocation
ORDER BY geolocation_zip_code_prefix
)

SELECT *
FROM new_geolocation;

-- Ci) LEADS_CLOSED TABLE NULL VALUES

SELECT 'mgl_id' AS column_name, COUNT(*) AS number_of_nulls
FROM leads_closed
WHERE mql_id IS NULL 

UNION

SELECT 'seller_id', COUNT(*)
FROM leads_closed
WHERE seller_id IS NULL

UNION

SELECT 'sdr_id', COUNT(*)
FROM leads_closed
WHERE sdr_id IS NULL

UNION

SELECT 'sr_id', COUNT(*)
FROM leads_closed
WHERE sr_id IS NULL

UNION

SELECT 'won_date', COUNT(*)
FROM leads_closed
WHERE won_date IS NULL

UNION 

SELECT 'business_segment', COUNT(*)
FROM leads_closed
WHERE business_segment IS NULL

UNION

SELECT 'lead_type', COUNT(*)
FROM leads_closed
WHERE lead_type IS NULL

UNION

SELECT 'lead_behaviour_profile', COUNT(*)
FROM leads_closed
WHERE lead_behaviour_profile IS NULL

UNION

SELECT 'has_company', COUNT(*)
FROM leads_closed
WHERE has_company IS NULL

UNION 

SELECT 'has_gtin', COUNT(*)
FROM leads_closed
WHERE has_gtin IS NULL

UNION

SELECT 'average_stock', COUNT(*)
FROM leads_closed
WHERE average_stock IS NULL

UNION

SELECT 'business_type', COUNT(*)
FROM leads_closed
WHERE business_type IS NULL

UNION

SELECT 'declared_product_catalog_size', COUNT(*)
FROM leads_closed
WHERE declared_product_catalog_size IS NULL

UNION

SELECT 'declared_monthly_revenue', COUNT(*)
FROM leads_closed
WHERE declared_monthly_revenue IS NULL
ORDER BY number_of_nulls ;

/** SIGNIFICANT NULL VALUES IN leads_closed **/

-- Cii) LEADS_CLOSED TABLE DUPLICATES

SELECT  mql_id, seller_id, sdr_id, sr_id, won_date,
        business_segment, lead_type, lead_behaviour_profile,
        has_company, has_gtin, average_stock,
        business_type, declared_product_catalog_size,
        declared_monthly_revenue,
        COUNT(*) AS number_of_duplicates
FROM leads_closed
GROUP BY mql_id, seller_id, sdr_id, sr_id, won_date,
        business_segment, lead_type, lead_behaviour_profile,
        has_company, has_gtin, average_stock,
        business_type, declared_product_catalog_size,
        declared_monthly_revenue
HAVING COUNT(*) > 1;

/** No duplicates in this table. **/

-- Di) LEADS_QUALIFIED TABLE NULL VALUES

SELECT 'mgl_id' AS column_name, COUNT(*) AS number_of_nulls
FROM leads_qualified
WHERE mql_id IS NULL 

UNION

SELECT 'first_contact_date', COUNT(*)
FROM leads_qualified
WHERE first_contact_date IS NULL

UNION

SELECT 'landing_page_id', COUNT(*)
FROM leads_qualified
WHERE landing_page_id IS NULL

UNION

SELECT 'origin', COUNT(*)
FROM leads_qualified
WHERE origin IS NULL;

/** only 60 out of 8000 visits are unknown (60 nulls in the origin column) **/

-- Dii) LEADS_QUALIFIED TABLE DUPLICATE VALUES

SELECT  mql_id, first_contact_date, landing_page_id,
        origin, COUNT(*) AS number_of_duplicates
FROM leads_qualified
GROUP BY mql_id, first_contact_date, landing_page_id, origin
HAVING COUNT(*) > 1;

-- Ei) SELLERS TABLE NULL VALUES

SELECT 'seller_id' AS column_name, COUNT(*) AS number_of_nulls
FROM sellers
WHERE seller_id IS NULL

UNION

SELECT 'seller_zip_code_prefix', COUNT(*)
FROM sellers
WHERE seller_zip_code_prefix IS NULL

UNION

SELECT 'seller_city', COUNT(*)
FROM sellers
WHERE seller_city IS NULL

UNION

SELECT 'seller_state', COUNT(*)
FROM sellers
WHERE seller_state IS NULL;

-- Eii) SELLERS TABLE DUPLICATE VALUES

SELECT  seller_id, seller_zip_code_prefix, seller_city, seller_state,
        COUNT(*) AS number_of_duplicates
FROM sellers
GROUP BY seller_id, seller_zip_code_prefix, seller_city, seller_state
HAVING COUNT(*) > 1;

/** No null or duplicate values in SELLERS TABLE **/

-- Fi) PRODUCTS TABLE NULL VALUES

SELECT 'product_id' AS column_name, COUNT(*) AS number_of_nulls
FROM products 
WHERE product_id IS NULL 

UNION

SELECT 'product_category_name', COUNT(*)
FROM products 
WHERE product_category_name IS NULL

UNION

SELECT 'product_name_lenght', COUNT(*)
FROM products 
WHERE product_name_lenght IS NULL

UNION

SELECT 'product_description_lenght', COUNT(*)
FROM products 
WHERE product_description_lenght IS NULL

UNION

SELECT 'product_photos_qty', COUNT(*)
FROM products 
WHERE product_photos_qty IS NULL

UNION 

SELECT 'product_weight_g', COUNT(*)
FROM products
WHERE product_weight_g IS NULL

UNION

SELECT 'product_length_cm', COUNT(*)
FROM products
WHERE product_length_cm IS NULL

UNION

SELECT 'product_height_cm', COUNT(*)
FROM products
WHERE product_height_cm IS NULL

UNION

SELECT 'product_width_cm', COUNT(*)
FROM products
WHERE product_width_cm IS NULL
ORDER BY number_of_nulls DESC;

/** 610 out of 32951 products have no category
Only 1 product with product_id (09ff539a621711667c43eba6a3bd8466) has a category but no description. **/

-- Fii) PRODUCTS TABLE DUPLICATE VALUES

SELECT  product_id, product_category_name, product_name_lenght,
        product_description_lenght, product_photos_qty,
        product_weight_g, product_length_cm, product_height_cm,
        product_width_cm, COUNT(*) AS number_of_duplicates
FROM products
GROUP BY product_id, product_category_name, product_name_lenght,
        product_description_lenght, product_photos_qty,
        product_weight_g, product_length_cm, product_height_cm,
        product_width_cm
HAVING COUNT(*) > 1;

/** All products are unique, no duplicate product. **/

-- Gi) ORDERS TABLE NULL VALUES

SELECT 'order_id' AS column_name, COUNT(*) AS number_of_nulls
FROM orders 
WHERE order_id IS NULL 

UNION

SELECT 'customer_id', COUNT(*)
FROM orders 
WHERE customer_id IS NULL

UNION

SELECT 'order_status', COUNT(*)
FROM orders 
WHERE order_status IS NULL

UNION

SELECT 'order_purchase_timestamp', COUNT(*)
FROM orders 
WHERE order_purchase_timestamp IS NULL

UNION

SELECT 'order_approved_at', COUNT(*)
FROM orders 
WHERE order_approved_at IS NULL

UNION 

SELECT 'order_delivered_carrier_date', COUNT(*)
FROM orders
WHERE order_delivered_carrier_date IS NULL

UNION

SELECT 'order_delivered_customer_date', COUNT(*)
FROM orders
WHERE order_delivered_customer_date IS NULL

UNION

SELECT 'order_estimated_delivery_date', COUNT(*)
FROM orders
WHERE order_estimated_delivery_date IS NULL
ORDER BY number_of_nulls DESC;

/** Significant null values in 3 columns (order_delivered_customer_date, order_delivered_carrier_date, order_approved_at) **/

-- Gii) ORDERS TABLE DUPLICATE VALUES

SELECT  order_id, customer_id, order_status,
        order_purchase_timestamp, order_approved_at,
        order_delivered_carrier_date, order_delivered_customer_date,
        order_estimated_delivery_date,
        COUNT(*) AS number_of_duplicates
FROM orders
GROUP BY order_id, customer_id, order_status,
        order_purchase_timestamp, order_approved_at,
        order_delivered_carrier_date, order_delivered_customer_date,
        order_estimated_delivery_date
HAVING COUNT(*) > 1;

/** NO duplicate orders in this table **/

-- Hi) ORDER_ITEMS NULL VALUES

SELECT 'order_id' AS column_name, COUNT(*) AS number_of_nulls
FROM order_items 
WHERE order_id IS NULL 

UNION

SELECT 'order_item_id', COUNT(*)
FROM order_items 
WHERE order_item_id IS NULL

UNION

SELECT 'product_id', COUNT(*)
FROM order_items 
WHERE product_id IS NULL

UNION

SELECT 'seller_id', COUNT(*)
FROM order_items
WHERE seller_id IS NULL

UNION

SELECT 'shipping_limit_date', COUNT(*)
FROM order_items
WHERE shipping_limit_date IS NULL

UNION 

SELECT 'price', COUNT(*)
FROM order_items
WHERE price IS NULL

UNION

SELECT 'freight_value', COUNT(*)
FROM order_items
WHERE freight_value IS NULL
ORDER BY number_of_nulls;

/** No null values in order_items **/

-- Hii) ORDER_ITEMS DUPLICATE VALUES

SELECT  order_id, order_item_id, product_id, seller_id,
        shipping_limit_date, price, freight_value,
        COUNT(*) AS number_of_duplicates
FROM order_items
GROUP BY    order_id, order_item_id, product_id, seller_id,
            shipping_limit_date, price, freight_value
HAVING COUNT(*) > 1
ORDER BY number_of_duplicates;

/** No duplicate order_items **/

-- Ii) ORDER_PAYMENTS NULL VALUES

SELECT 'order_id' AS column_name, COUNT(*) AS number_of_nulls
FROM order_payments
WHERE order_id IS NULL 

UNION

SELECT 'payment_sequential', COUNT(*)
FROM order_payments 
WHERE payment_sequential IS NULL

UNION

SELECT 'payment_type', COUNT(*)
FROM order_payments 
WHERE payment_type IS NULL

UNION

SELECT 'payment_installments', COUNT(*)
FROM order_payments
WHERE payment_installments IS NULL

UNION

SELECT 'payment_value', COUNT(*)
FROM order_payments
WHERE payment_value IS NULL
ORDER BY number_of_nulls;

-- Iii) ORDER_PAYMENTS DUPLICATE VALUES

SELECT  order_id, payment_sequential, payment_type,
        payment_installments, payment_value,
        COUNT(*) AS number_of_duplicates
FROM order_payments
GROUP BY    order_id, payment_sequential, payment_type,
            payment_installments, payment_value
HAVING COUNT(*) > 1
ORDER BY number_of_duplicates;

/** No null or duplicates on this table **/

-- Ji) ORDER REVIEWS NULL VALUES

SELECT 'review_id' AS column_name, COUNT(*) AS number_of_nulls
FROM order_reviews
WHERE review_id IS NULL

UNION

SELECT 'order_id', COUNT(*)
FROM order_reviews 
WHERE order_id IS NULL

UNION 

SELECT 'review_score', COUNT(*)
FROM order_reviews
WHERE review_score IS NULL

UNION

SELECT 'review_comment_title', COUNT(*)
FROM order_reviews
WHERE review_comment_title IS NULL

UNION

SELECT 'review_comment_message', COUNT(*)
FROM order_reviews
WHERE review_comment_message IS NULL

UNION

SELECT 'review_creation_date', COUNT(*)
FROM order_reviews
WHERE review_creation_date IS NULL

UNION

SELECT 'review_answer_timestamp', COUNT(*)
FROM order_reviews
WHERE review_answer_timestamp IS NULL
ORDER BY number_of_nulls DESC;

/** All order_ids have review scores which is good for product validation. **/

-- Jii) ORDER REVIEWS DUPLICATES VALUES

SELECT  review_id, order_id, review_score, 
        review_comment_title, review_comment_message,
        review_creation_date, review_answer_timestamp,
        COUNT(*) AS number_of_duplicates
FROM order_reviews
GROUP BY    review_id, order_id, review_score,
            review_comment_title, review_comment_message,
            review_creation_date, review_answer_timestamp
HAVING COUNT(*) > 1
ORDER BY number_of_duplicates;

/** NO duplicate reviews, all reviews are unique. **/


-- Ki) PRODUCT CATEGORY NAME TRANSLATION NULL VALUES

SELECT 'product_category_name' AS column_name, COUNT(*) AS number_of_nulls
FROM product_category_name_translation
WHERE product_category_name IS NULL

UNION

SELECT 'product_category_name_english', COUNT(*)
FROM product_category_name_translation
WHERE product_category_name_english IS NULL
ORDER BY number_of_nulls DESC;

-- Kii) PRODUCT CATEGORY NAME TRANSLATION DUPLICATE VALUES

SELECT  product_category_name,
        product_category_name_english,
        COUNT(*) AS number_of_duplicates
FROM product_category_name_translation
GROUP BY    product_category_name,
        product_category_name_english
HAVING COUNT(*) > 1
ORDER BY number_of_duplicates;

/** No null or duplicate values on this table. **/





/** CLEANING THE DATASET **/

/** 2) CLEANING SPECIAL CHARACTERS IN GEOLOCATION TABLE (CITY COLUMN)

Ai) REMOVING IDENTIFIED SPECIAL CHARACTERS IN GEOLOCATION_CITY COLUMN 

I was able to identify some special alphabet characters used in brazil geolocation_city column which are á, é, í, ó, ú, â, ê, ô, ã, õ, à, and ç

Which has to be replaced for data consistency in the customer and seller city column

--- To replace the special alphabet characters

I created a temporary table for editing the geolocation_city column. **/

CREATE TEMP TABLE new_geolocation_one AS
SELECT  DISTINCT geolocation_zip_code_prefix, geolocation_lat,
        geolocation_lng, geolocation_city,
        geolocation_state
FROM geolocation
ORDER BY geolocation_zip_code_prefix ; /** NOTE - TO REMOVE ALL DUPLICATES **/

CREATE TEMP TABLE real_geolocation AS
SELECT      geolocation_zip_code_prefix,
            geolocation_lat,
            geolocation_lng,
            REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE(geolocation_city, '...a', 'a'),
            '´', ''),
            '4o.', 'quarto'),
            '4º', 'quarto'),
            'á', 'a'),
            'â', 'a'),
            'ã', 'a'),
            'à', 'a'),
            'ç', 'c'),
            'é', 'e'),
            'ê', 'e'),
            'í', 'i'),
            'ó', 'o'),
            'ô', 'o'),
            'õ', 'o'),
            'ú', 'u'),
            '''', ''),
            '-', ' ') AS geolocation_city,
            geolocation_state       
from new_geolocation_one
ORDER BY geolocation_city;


/** Aii) TO KNOW IF THERE ARE STILL OTHERS SPECIAL CHARACTERS FROM THE PREVIOUS TEMPORARY TABLE FROM GEOLOCATION TABLE **/

SELECT * FROM
real_geolocation
WHERE   geolocation_city LIKE '%\%' OR
        geolocation_city LIKE '%/%' OR
        geolocation_city LIKE '%&%' OR
        geolocation_city LIKE '%,%' OR
        geolocation_city LIKE '%.%' OR 
        geolocation_city LIKE '%!%' OR 
        geolocation_city LIKE '%#%' OR 
        geolocation_city LIKE '%|%' OR 
        geolocation_city LIKE '%^%' OR 
        geolocation_city LIKE '%$%' OR
        geolocation_city LIKE '%(%' OR 
        geolocation_city LIKE '%)%' OR 
        geolocation_city LIKE '%*%' OR 
        geolocation_city LIKE '%@%' OR 
        geolocation_city LIKE '%?%' OR 
        geolocation_city LIKE '%}%' OR
        geolocation_city LIKE '''' OR 
        geolocation_city LIKE '-' OR 
	geolocation_city LIKE '%`%';

/** NOTE :- For some reason, REGEX did not work **/

-- Aiii) THEN I CREATED A REAL TABLE TO STORE MY EDITED VALUES

CREATE TABLE geolocation_real AS 
SELECT      geolocation_zip_code_prefix, geolocation_lat, geolocation_lng,
	    REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE (geolocation_city, 'antunes (igaratinga)', 'antunes'),
            'bacaxa (saquarema)   distrito', 'bacaxa'),
            'california da barra (barra do pirai)', 'california da barra'),
            'campo alegre de lourdes, bahia, brasil', 'campo alegre de lourdes'),
            'florian&oacute;polis', 'florianopolis'),
            'itabatan (mucuri)', 'itabatan'),
            'jacare (cabreuva)', 'jacare'),
            'monte gordo (camacari)   distrito', 'monte gordo'),
            'penedo (itatiaia)', 'penedo'),
            'praia grande (fundao)   distrito', 'praia grande'),
            'realeza (manhuacu)', 'realeza'),
            'rio de janeiro, rio de janeiro, brasil', 'rio de janeiro'),
            'tamoios (cabo frio)', 'tamoios'),
            '* cidade', 'cidade gaucha') AS geolocation_city,
            geolocation_state
FROM real_geolocation;  

-- THEN PROCEED TO DROP THE TWO TEMPORARY TABLES CREATED

DROP TABLE new_geolocation_one;

DROP TABLE real_geolocation;

/** Aiv) I ALSO NOTICED IN THE GEOLOCATION_REAL TABLE THAT SOME STATES ABBREVATION EXISTS IN THE
GEOLOCATION_CITY COLUMN (SOME HAVE THE SAME NAME WITH THEIR CORRESPONDING STATES) **/

SELECT * FROM
geolocation_real
WHERE   geolocation_city LIKE '%pr' OR 
        geolocation_city LIKE '%sp' OR
        geolocation_city LIKE '%mg' OR
        geolocation_city LIKE '%mt' OR
        geolocation_city LIKE '%ms' OR
        geolocation_city LIKE '%pr' OR
        geolocation_city LIKE '%sc' OR 
        LENGTH(geolocation_city) < 3
ORDER BY geolocation_city;

/** NOTE:- THERE ARE SOME CITIES WITH THE SAME STATE NAME, THIS IS WHY I CHOOSE THESE PARTICULAR STATES. **/

--- CLEANING THE RESULT

UPDATE geolocation_real
SET geolocation_city = 'sao paulo'
WHERE geolocation_city = 'sp';

UPDATE geolocation_real
SET geolocation_city = 'rio de janeiro'
WHERE geolocation_city = 'rj';

UPDATE geolocation_real
SET geolocation_city = 'belo horizonte'
WHERE geolocation_city = 'bh';

UPDATE geolocation_real
SET geolocation_city = 'franca'
WHERE geolocation_zip_code_prefix = 14407;

UPDATE geolocation_real
SET geolocation_city = 'guarulhos'
WHERE geolocation_zip_code_prefix = 7174;

UPDATE geolocation_real
SET geolocation_city = 'lavras'
WHERE geolocation_zip_code_prefix = 37200;

UPDATE geolocation_real
SET geolocation_city = 'limeira do oeste'
WHERE geolocation_zip_code_prefix = 38295;

UPDATE geolocation_real
SET geolocation_city = 'arraial dajuda'
WHERE 	geolocation_state = 'BA' AND
        geolocation_city LIKE '%arraial d%';

-- jacare means alligator in brazil
-- Jacarei is a city in brazil sao paulo

UPDATE geolocation_real
SET geolocation_city = 'jacarei'
WHERE geolocation_city LIKE 'jacare%'
        AND geolocation_state = 'SP';

UPDATE geolocation_real
SET geolocation_city = 'santa barbara doeste'
WHERE geolocation_state = 'SP' AND
        geolocation_city LIKE '%santa barbara d%';

UPDATE geolocation_real
SET geolocation_city = 'sao paulo'
WHERE geolocation_state = 'SP' AND
        geolocation_city LIKE 'saopaulo';

UPDATE geolocation_real
SET geolocation_city = 'dias davila'
WHERE geolocation_city = 'dias d avila';


UPDATE geolocation_real
SET geolocation_city =  REPLACE
                        (REPLACE
                        (REPLACE
                        (REPLACE
                        (REPLACE
                        (REPLACE
                        (REPLACE(geolocation_city, 'd oeste', 'doeste'),
                        'd  oeste', 'doeste'),
                        'd  arco', 'darco'),
                        'd agua', 'dagua'),
                        'd alianca', 'dalianca'),
                        'd alho', 'dalho'),
                        'sao joao do pau d%26apos%3balho', 'sao joao do pau dalho');

UPDATE geolocation_real
SET geolocation_city = TRIM(geolocation_city); /** #TRIMMED BECAUSE OF WHITE SPACES

THESE UPDATES WERE BASED ON RECORDS FROM THE REAL GEOLOCATION SIMILARITIES

TO CREATE GEOLOCATION_REAL TABLE WITH NO DUPLICATES (geolocation_new) **/

CREATE TEMP TABLE no_duplicates_geolocation AS 
SELECT  DISTINCT geolocation_zip_code_prefix, geolocation_lat,
        geolocation_lng, geolocation_city,
        geolocation_state
FROM geolocation_real
ORDER BY geolocation_zip_code_prefix; 

CREATE TABLE geolocation_new AS
SELECT *
FROM no_duplicates_geolocation; 

SELECT *
FROM geolocation_new;

DROP TABLE no_duplicates_geolocation;

DROP TABLE geolocation_real;

/** NOTE - THERE ARE 1000163 records in the geolocation table after removing the duplicates and correcting the city column properly. There are now 720400 records. **/
 

--	CLEANING SPECIAL CHARACTERS IN SELLERS TABLE (CITY COLUMN)

-- Bi) REMOVING IDENTIFIED SPECIAL CHARACTERS IN SELLER_CITY COLUMN

SELECT *
FROM sellers
WHERE   seller_city LIKE '%á%' OR
        seller_city LIKE '%é%' OR
        seller_city LIKE '%í%' OR
        seller_city LIKE '%ó%' OR
        seller_city LIKE '%ú%' OR 
        seller_city LIKE '%â%' OR 
        seller_city LIKE '%ê%' OR 
        seller_city LIKE '%ô%' OR 
        seller_city LIKE '%ã%' OR 
        seller_city LIKE '%õ%' OR
        seller_city LIKE '%à%' OR 
        seller_city LIKE '%ç%';

--- Seller_city doesn't contain any special alphabet characters.


SELECT *
FROM sellers
WHERE   seller_city LIKE '%\%' OR
        seller_city LIKE '%/%' OR
        seller_city LIKE '%&%' OR
        seller_city LIKE '%,%' OR
        seller_city LIKE '%.%' OR 
        seller_city LIKE '%!%' OR 
        seller_city LIKE '%#%' OR 
        seller_city LIKE '%|%' OR 
        seller_city LIKE '%^%' OR 
        seller_city LIKE '%$%' OR
        seller_city LIKE '%(%' OR 
        seller_city LIKE '%)%' OR 
        seller_city LIKE '%*%' OR 
        seller_city LIKE '%@%' OR 
        seller_city LIKE '%?%' OR 
        seller_city LIKE '%}%' OR
        seller_city LIKE '%''%' OR
        seller_city LIKE '%-%' OR
        seller_city LIKE '%`%';

-- Bii) I CREATED A REAL TABLE (SELLERS_REAL) TO STORE EDITED VALUES

CREATE TABLE sellers_real AS 
SELECT      seller_id, seller_zip_code_prefix,
            REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE
            (REPLACE (seller_city, 'andira-pr', 'andira'),
            'arraial d''ajuda (porto seguro)', 'arraial dajuda'),
            'auriflama/sp', 'auriflama'),
            'barbacena/ minas gerais', 'barbacena'),
            'carapicuiba / sao paulo', 'carapicuiba'),
            'cariacica / es', 'cariacica'),
            'jacarei / sao paulo', 'jacarei'),
            'lages - sc', 'lages'),
            'maua/sao paulo', 'maua'),
            'mogi das cruzes / sp', 'mogi das cruzes'),
            'novo hamburgo, rio grande do sul, brasil', 'novo hamburgo'),
            'pinhais/pr', 'pinhais'),
            'ribeirao preto / sao paulo', 'ribeirao preto'),
            'rio de janeiro / rio de janeiro', 'rio de janeiro'),
            'rio de janeiro \rio de janeiro', 'rio de janeiro'),
            'rio de janeiro, rio de janeiro, brasil', 'rio de janeiro'),
            'santa barbara d''oeste', 'santa barbara doeste'),
            'santo andre/sao paulo', 'santo andre'),
            'sao miguel d''oeste', 'sao miguel doeste'),
            'sao paulo - sp', 'sao paulo'),
            'sao paulo / sao paulo', 'sao paulo'),
            'sao sebastiao da grama/sp', 'sao sebastiao da grama'),
            'sbc/sp', 'sbcampo'),
            'sp / sp', 'sao paulo'),
            'vendas@creditparts.com.br', 'maringa') AS seller_city,
            seller_state
FROM sellers;  

/** Biii) I ALSO NOTICED IN THE SELLERS_REAL TABLE THAT SOME STATES ABBREVATION EXISTS IN THE SELLER_CITY COLUMN (SOME HAVE THE SAME NAME WITH THEIR CORRESPONDING STATES) **/

SELECT * FROM
sellers_real
WHERE   seller_city LIKE '%pr' OR 
        seller_city LIKE '%sp' OR
        seller_city LIKE '%mg' OR
        seller_city LIKE '%mt' OR
        seller_city LIKE '%ms' OR
        seller_city LIKE '%pr' OR
        seller_city LIKE '%sc' OR 
        LENGTH(seller_city) < 3 ;

--- CLEANING THE RESULT

UPDATE sellers_real
SET seller_city = 'sao paulo'
WHERE   seller_state = 'SP' AND 
        seller_city IN ('sao paulo sp', 'sp');

UPDATE sellers_real
SET seller_city = REPLACE(seller_city, 'd oeste', 'doeste');

UPDATE sellers_real
SET seller_city = 'rio de janeiro'
WHERE seller_city = 04482255; 

/** (NOTE: I compared seller_zip_code_prefix and seller_state of this particular seller to geolocation_zip_code_prefix and geolocation_state from geolocation table, so i replaced the city since it is related) **/

UPDATE sellers_real
SET seller_city = TRIM(seller_city);




-- 	CLEANING SPECIAL CHARACTERS IN CUSTOMERS TABLE (CITY COLUMN)

-- Ci) REMOVING IDENTIFIED SPECIAL CHARACTERS IN CUSTOMER_CITY COLUMN

SELECT *
FROM customers
WHERE   customer_city LIKE '%á%' OR
        customer_city LIKE '%é%' OR
        customer_city LIKE '%í%' OR
        customer_city LIKE '%ó%' OR
        customer_city LIKE '%ú%' OR 
        customer_city LIKE '%â%' OR 
        customer_city LIKE '%ê%' OR 
        customer_city LIKE '%ô%' OR 
        customer_city LIKE '%ã%' OR 
        customer_city LIKE '%õ%' OR
        customer_city LIKE '%à%' OR 
        customer_city LIKE '%ç%';

--- Customer_city doesn't contain any special alphabet characters.


SELECT *
FROM customers
WHERE   customer_city LIKE '%\%' OR
        customer_city LIKE '%/%' OR
        customer_city LIKE '%&%' OR
        customer_city LIKE '%,%' OR
        customer_city LIKE '%.%' OR 
        customer_city LIKE '%!%' OR 
        customer_city LIKE '%#%' OR 
        customer_city LIKE '%|%' OR 
        customer_city LIKE '%^%' OR 
        customer_city LIKE '%$%' OR
        customer_city LIKE '%(%' OR 
        customer_city LIKE '%)%' OR 
        customer_city LIKE '%*%' OR 
        customer_city LIKE '%@%' OR 
        customer_city LIKE '%?%' OR 
        customer_city LIKE '%}%' OR
        customer_city LIKE '%''%' OR
        customer_city LIKE '%-%' OR
        customer_city LIKE '%`%';

/** Cii) I created a temporary table for editing the customer_city column since most of the special characters contain only '-' and ('). **/

CREATE TEMP TABLE real_customers AS 
SELECT  customer_id, customer_unique_id,
        customer_zip_code_prefix,
        REPLACE
        (REPLACE (customer_city, '-', ' '),
        '''', '') AS customer_city,
        customer_state
FROM customers;

-- ciii) THEN I CREATED A REAL TABLE TO STORE MY EDITED VALUES

CREATE TABLE customers_real AS 
SELECT  customer_id, customer_unique_id,
        customer_zip_code_prefix,
        REPLACE
        (REPLACE
        (REPLACE (customer_city, 'd oeste', 'doeste'),
        'd ajuda', 'dajuda'),
        'd avila', 'davila') AS customer_city,
        customer_state
FROM real_customers;


UPDATE customers_real
SET customer_city = TRIM(customer_city);

DROP TABLE real_customers; /** NOTE - TO REMOVE TEMP. TABLE CREATED. **/





/** QUERYING THE DATASET

STATES IN BRAZIL ABBREVATIONS
'pr', 'go', 'mg', 'pa', 'ce', 'ba', 'sc', 'pe', 'to',
'ma', 'rn', 'pi', 'rs', 'es', 'mt', 'ac', 'sp', 'rj',
'al', 'pb', 'ms', 'ro', 'rr', 'am', 'ap', 'se', 'df' **/

--- GEOLOCATION

SELECT COUNT(DISTINCT(geolocation_state)) AS total_states
FROM geolocation;

-- TOTAL STATES - 27

SELECT COUNT(DISTINCT(geolocation_city)) AS total_cities
FROM geolocation;

-- TOTAL STATES - 8011


--- SELLERS

SELECT COUNT(DISTINCT(seller_state)) AS total_states
FROM sellers;

-- TOTAL STATES - 23

SELECT COUNT(DISTINCT(seller_city)) AS total_cities
FROM sellers;

-- TOTAL SELLER CITIES - 611

--- CUSTOMERS
SELECT COUNT(DISTINCT(customer_state)) AS total_states
FROM customers;

-- TOTAL STATES 27

SELECT COUNT(DISTINCT(customer_city)) AS total_cities
FROM customers;

-- TOTAL CUSTOMER CITIES - 4119

/** I will be using geolocation_new, customers_real, and sellers_real to query because it contains edited clean data values. **/ 

-- GEOLOCATION_NEW

SELECT COUNT(DISTINCT(geolocation_state)) AS total_states
FROM geolocation_new;

-- TOTAL STATE - 27

SELECT COUNT(DISTINCT(geolocation_city)) AS total_cities
FROM geolocation_new;

-- TOTAL CITIES - 5887

-- SELLERS_REAL
 
SELECT COUNT(DISTINCT(seller_state)) AS total_states
FROM sellers_real;

-- TOTAL SELLER STATES - 23

SELECT COUNT(DISTINCT(seller_city)) AS total_cities
FROM sellers_real;

-- TOTAL SELLER CITIES - 589


-- CUSTOMERS_REAL

SELECT COUNT(DISTINCT(customer_state)) AS total_states
FROM customers_real;

-- TOTAL STATES - 27

SELECT COUNT(DISTINCT(customer_city)) AS total_cities
FROM customers_real;

-- TOTAL CUSTOMER CITIES - 4113




-- 3) TOP 5 CUSTOMER'S STATE WITH THE MOST ORDERS

SELECT c.customer_state, count(*) AS number_of_orders
FROM customers_real c 
JOIN orders o ON
o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY number_of_orders DESC
LIMIT 5;

-- ANS - SP(41746), RJ(12852), MG(11635), RS(5466), PR(5045)




-- 4) TOP 5 CUSTOMER'S STATE WITH THE LEAST ORDERS

SELECT c.customer_state, count(*) AS number_of_orders
FROM customers_real c 
JOIN orders o ON
o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY number_of_orders ASC
LIMIT 5;

-- ANS - RR(46), AP(68), AC(81), AM(148), RO(253)




-- 5) TOP 10 CUSTOMER CITIES WITH MOST ORDERS

SELECT c.customer_city, count(*) AS number_of_orders
FROM customers_real c 
JOIN orders o ON
o.customer_id = c.customer_id
GROUP BY c.customer_city
ORDER BY number_of_orders DESC
LIMIT 10;

/** ANS - 	sao paulo(15540), rio de Janeiro(6882), belo horizonte(2773),
	brasilia(2131), curitiba(1521), campinas(1444), porto alegre(1379),
	Salvador(1245), Guarulhos(1189), sao bernardo do campo(938) **/




-- 6) CUSTOMER CITIES WITH LEAST ORDERS

SELECT c.customer_city, count(*) AS number_of_orders
FROM customers_real c 
JOIN orders o ON
o.customer_id = c.customer_id
GROUP BY c.customer_city
HAVING number_of_orders < 500;

-- Out of 4113 cities, customers from 4091 cities has less than 500 orders. 

 

-- 7) TOP 5 LANDING PAGE'S ID THAT ATTRACTS POTENTIAL VISITOR SELLERS

SELECT landing_page_id, COUNT(landing_page_id) AS no_of_visits
FROM leads_qualified
GROUP BY  landing_page_id
ORDER BY no_of_visits DESC
LIMIT 5;

/** - b76ef37428e6799c421989521c0e5077 (912 visits)
- 22c29808c4f815213303f8933030604c (883 visits)
- 58326e62183c14b0c03085c33b9fdc44 (495 visits)
- 88740e65d5d6b056e0cda098e1ea6313 (445 visits)
- ce1a65abd0973638f1c887a6efcfa82d (394 visits) **/




-- 8) LANDING PAGE'S ID THAT ATTRACTED LEAST POTENTIAL VISITOR SELLERS

SELECT landing_page_id, COUNT(landing_page_id) AS no_of_visits
FROM leads_qualified
GROUP BY  landing_page_id
HAVING no_of_visits < 2
ORDER BY no_of_visits ASC;

-- ANS - 247 landing pages have only one visit.




-- 9) SOURCE OF VISITS TO LANDING PAGES

SELECT origin, COUNT(*) as visits_per_origin
FROM leads_qualified
GROUP BY origin
order by visits_per_origin DESC;

/** Sellers from organic_search, paid_search, social and unknown source constitutes to over half of potential visitor sellers **/





-- 10) POTENTIAL VISITOR SELLER'S VISIT PER YEAR

SELECT strftime('%Y', first_contact_date) AS year, COUNT(*) AS visits_per_year
FROM leads_qualified
GROUP BY year;

/** 2017 - 2002 visits
2018 - 5998 visits
A significant increase, twice more than the previous year 2017 **/




-- 11) CLOSED SELLER'S VISIT SOURCE

SELECT lq.origin, COUNT(*) AS closed_sellers
FROM leads_closed lc 
JOIN leads_qualified lq
        ON lc.mql_id = lq.mql_id
GROUP BY lq.origin
ORDER BY closed_sellers DESC;

/** ANS - 	organic_search (271), paid_search (195), unknown (179), social (75)
	direct_traffic (56), referral (24), email (15), unknown_origin (14),
	display (6) **/




-- 12) POTENTIAL SELLER'S VISIT OVER TIME

SELECT  strftime('%m', first_contact_date) AS month, COUNT(*) AS visits_per_month,
        strftime('%Y', first_contact_date) AS year
FROM leads_qualified
GROUP BY month
ORDER BY year DESC;

-- June and December 2017 has significant low visits. 



-- 13) CLOSED SELLERS FROM THE LANDING PAGE (ID)

SELECT  DISTINCT(seller_id)
FROM leads_closed;

-- ANS - 842 closed sellers





-- 14) CLOSED SELLERS FROM THE LANDING PAGE THAT ARE IN THE SELLER'S TABLE (REGISTERED)

SELECT lc.seller_id
FROM leads_closed lc 
JOIN sellers_real sr 
        ON lc.seller_id = sr.seller_id;

-- ANS - Only 380 registered sellers out of 842 closed.





-- 15) SALE'S REPRESENTATIVES WHO HANDLED ALL CLOSED SELLERS

SELECT DISTINCT(sr_id)
FROM leads_closed ;

-- ANS - 22 SALES REP. HANDLED ALL 842 CLOSED SELLERS

-- BUT 

SELECT DISTINCT(sr_id)
FROM leads_closed lc 
JOIN sellers_real sr 
        ON lc.seller_id = sr.seller_id;

/** ONLY 18 SALES REP. WERE ABLE TO CONVINCE 380 TO REGISTER IN THE SELLER'S TABLE LIST

WHILE 4 SALES REP. COULDN'T. **/

SELECT DISTINCT(sr_id)
FROM leads_closed
WHERE sr_id NOT IN (SELECT DISTINCT(sr_id) 
                FROM leads_closed lc 
                JOIN sellers_real sr ON lc.seller_id = sr.seller_id);

/** THE 4 SALES REP. ID ARE 

- 0a0fb2b07d841f84fb6714e35c723075
- 9749123c950bf8363ace42cb1c2d0815
- b90f87164b5f8c2cfa5c8572834dbe3f
- 6aa3b86a83d784b05f0e37e26b20860d **/





-- 16) DELIVERY REPORT

SELECT  order_status, order_id,
        julianday(order_approved_at) -
        julianday(order_purchase_timestamp) AS approval_duration
FROM orders
WHERE order_status = 'delivered'
ORDER BY approval_duration DESC;

-- Most of the orders whose approval is less than 6 days were delivered successfully.





-- 17) ORDERS REPORT

-- Ai)
SELECT DISTINCT(order_id)
FROM orders;

-- THERE ARE 99441 distinct orders


-- Aii) 
SELECT  DISTINCT(order_id)
FROM orders
WHERE order_status = 'delivered';

-- 96478 orders were delivered successfully

-- Aiii)
SELECT  order_status, COUNT(*) AS process_count
FROM orders
WHERE order_status != 'delivered'
GROUP BY order_status
ORDER BY process_count desc;

/** while out of the 2963 orders remaining
- 1107 has been shipped
- 625 has been canceled
- 609 is unavailable
- 314 has been invoiced
- 301 is still in processing
- 5 has just been created
- and 2 has just been approved. **/

-- Aiv) ORDER PER DAY

SELECT  strftime('%Y-%m-%d', order_purchase_timestamp) AS time_ordered, COUNT(*) AS no_of_orders_daily
FROM orders
GROUP BY strftime('%Y-%m-%d', order_purchase_timestamp)
ORDER BY no_of_orders_daily DESC;

/** ANS - THERE WAS A HUGE SPIKE OF ORDERS IN NOVEMBER 2017, THIS MAY BE DUE TO THE FACT THAT PEOPLE ARE PREPARING FOR XMAS A MONTH AHEAD, THE LARGEST ORDER CAME IN ON NOVEMBER 24TH (1176). **/

-- Av) ORDER BY CATEGORY

-- TOP 10 ORDERS BY CATEGORY WHERE ITEMS WERE DELIVERED SUCCESSFULLY

SELECT  COALESCE(pc.product_category_name_english, 'unknown_category')
        AS category_by_english_name,
        COUNT(*) AS no_of_orders_per_category
FROM orders o 
JOIN order_items oi
        ON o.order_id = oi.order_id
JOIN products p
        ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation pc
        ON p.product_category_name = pc.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY pc.product_category_name_english
ORDER BY no_of_orders_per_category DESC
LIMIT 10;


/** ANS - 	bed_bath_table (10953), health_beauty (9465), sports_leisure (8431),
	furniture_decor (8160), computers_accessories (7644), housewares (6795),
	watches_gifts (5859), telephony (4430), garden_tools (4268),
	auto (4140) **/

-- LEAST 10 ORDERS BY CATEGORY WHERE ITEMS WERE DELIVERED SUCCESSFULLY 

SELECT  COALESCE(pc.product_category_name_english, 'unknown_category')
        AS category_by_english_name,
        COUNT(*) AS no_of_orders_per_category
FROM orders o 
JOIN order_items oi
        ON o.order_id = oi.order_id
JOIN products p
        ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation pc
        ON p.product_category_name = pc.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY pc.product_category_name_english
ORDER BY no_of_orders_per_category ASC
LIMIT 10;

/** ANS - 	security_and_services (2), fashion_childrens_clothes (7), cds_dvds_musicals (14),
	la_cuisine (14), arts_and_craftmanship (24), fashion_sport (29),
	home_comfort_2 (30), flowers (33), diapers_and_hygiene (37), furniture_mattress_and_upholstery (37) **/
	


-- 18) PRODUCT CATEGORY UPDATE

WITH updated_categories AS (
SELECT p.product_category_name, pc.product_category_name_english AS category_english_translation
FROM products p
LEFT JOIN product_category_name_translation pc 
        ON p.product_category_name = pc.product_category_name
GROUP BY  p.product_category_name, pc.product_category_name_english
ORDER BY pc.product_category_name)

SELECT  COALESCE(product_category_name, 'unknown_category') AS product_category_name,
        CASE
            WHEN category_english_translation IS NULL THEN 'no_english_translation'
            ELSE category_english_translation 
            END AS category_by_english_name
FROM updated_categories;


/** OUT OF 74 PRODUCT CATEGORY, 1 CATEGORY IS UNKNOWN, 2(PC_GAMER AND portateis_cozinha_e_preparadores_de_alimentos) HAS NO ENGLISH TRANSLATED NAME , AND ONLY 71 CATEGORIES ARE PROPERLY NAMED. THIS MEANS 3 CATEGORIES HAS NO ENGLISH TRANSLATION. **/

-- RECOMMENDATION -  The product_category_name_translation has to be updated




-- 19) TOP 5 MOST EXPENSIVE PRODUCT CATEGORY BY PRICE AND FREIGHT VALUE

SELECT 	DISTINCT(pc.product_category_name_english) AS category_by_english_name,
	SUM(oi.price + oi.freight_value) OVER
	(PARTITION BY p.product_category_name) AS total_by_category
FROM products p 
JOIN order_items oi
        ON p.product_id = oi.product_id
LEFT JOIN product_category_name_translation pc 
        ON p.product_category_name = pc.product_category_name
ORDER BY total_by_category DESC
LIMIT 5;

-- ANS - 	health_beauty (1441248.07), watches_gifts (1305541.61), bed_bath_table (1241681.72), 	sports_leisure (1156656.48), computers_accessories (1059272.4)




-- 20) 5 LEAST PRODUCT CATEGORY BY PRICE AND FREIGHT VALUE

SELECT 	DISTINCT(pc.product_category_name_english) AS category_by_english_name,
	SUM(oi.price + oi.freight_value) OVER (PARTITION BY p.product_category_name)
	AS total_by_category
FROM products p 
JOIN order_items oi
        ON p.product_id = oi.product_id
LEFT JOIN product_category_name_translation pc 
        ON p.product_category_name = pc.product_category_name
ORDER BY total_by_category ASC
LIMIT 5;

/** ANS - 	security_and_services (324.51), fashion_childrens_clothes (665.36),
	cds_dvds_musicals (954.99), home_comfort_2 (1170.58), flowers (1598.91) **/




-- 21) LEAST EXPENSIVE ITEM IN ALL CATEGORIES

SELECT  p.product_id, pc.product_category_name_english AS category_by_english_name,
        MIN(price + freight_value) AS price_of_item
FROM order_items oi
JOIN products p
        ON p.product_id = oi.product_id
LEFT JOIN product_category_name_translation pc 
        ON p.product_category_name = pc.product_category_name;

/** ANS -	prodcut_id (adc48fd26eea311ca6856b58dfc3ca21), housewares category
	price (6.08) **/





-- 22) MOST EXPENSIVE ITEM IN ALL CATEGORIES

SELECT  p.product_id, pc.product_category_name_english AS category_by_english_name,
        MAX(price + freight_value) AS price_of_item
FROM order_items oi
JOIN products p
        ON p.product_id = oi.product_id
LEFT JOIN product_category_name_translation pc 
        ON p.product_category_name = pc.product_category_name;

/** ANS - 	prodcut_id (489ae2aa008f021502940f251d4cce7f), housewares category
	price (6929.31) **/




-- 23) MOST AMOUNT SPENT PER CATEGORIES WHOSE ORDERS WERE DELIVERED SUCCESSFULLY (TOP 10)

SELECT  DISTINCT(COALESCE(pc.product_category_name_english, 'unknown_category'))
        AS category_by_english_name,
        SUM(oi.price + oi.freight_value) OVER
        (PARTITION BY p.product_category_name) AS total_by_category
FROM orders o 
JOIN order_items oi
        ON o.order_id = oi.order_id
JOIN products p
        ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation pc
        ON p.product_category_name = pc.product_category_name
WHERE o.order_status = 'delivered'
ORDER BY total_by_category DESC
LIMIT 10;

/** ANS - 	health_beauty (1412089.53), watches_gifts (1264333.12), bed_bath_table (1225209.26),
	sports_leisure (1118256.91), computers_accessories (1032723.77),
	furniture_decor (880329.92), housewares (758392.25), cool_stuff (691680.89),
	auto (669454.75), garden_tools (567145.68).  **/

/** NOTE - 	THE LIST HERE CORRESPONDS TO THE LIST IN 17(av), WE CAN SAY THERE IS A CORRELATION
	BETWEEN ORDERS PLACED AND THE AMOUNT SPENT. CHECK CATEGORY WITH THE MOST ORDERS. **/





-- 24) LEAST AMOUNT SPENT PER CATEGORIES WHOSE ORDERS WERE DELIVERED SUCCESSFULLY (TOP 10)

SELECT  DISTINCT(COALESCE(pc.product_category_name_english, 'unknown_category'))
        AS category_by_english_name,
        SUM(oi.price + oi.freight_value) OVER
        (PARTITION BY p.product_category_name) AS total_by_category
FROM orders o 
JOIN order_items oi
        ON o.order_id = oi.order_id
JOIN products p
        ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation pc
        ON p.product_category_name = pc.product_category_name
WHERE o.order_status = 'delivered'
ORDER BY total_by_category ASC
LIMIT 10;

/** ANS - 	security_and_services (324.51), fashion_childrens_clothes (598.67),
	cds_dvds_musicals (954.99), home_comfort_2 (1170.58),
	unknown_category (1430.1), flowers (1598.91), diapers_and_hygiene (2046.19),
	arts_and_craftmanship (2184.14), la_cuisine (2388.54), fashion_sport (2657.55)	**/


/** NOTE - 	SAME GOES FOR THE LIST IN 17(av), EXCEPT THIS CATEGORY 	'furniture_mattress_and_upholstery' WHICH IS NOT ON THE LIST OF CATEGORY WITH THE 	LEAST ORDERS. WE CAN ALSO SAY THEIR IS A CORRELATION BETWEEN ORDERS AND AMOUNT 	SPENT. **/




-- 25) TOP 10 CUSTOMERS (ID) WITH THE MOST ORDERS

SELECT c.customer_id, COUNT(*) as no_of_orders
FROM customers_real c 
JOIN orders o ON
o.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY no_of_orders DESC;

-- NO CUSTOMER PLACED MORE THAN 1 ORDER. 

-- RECOMMENDATION - PROMO/REWARDS SHOULD BE INITIATED TO PERSUED CUSTOMERS TO BY MORE THAN 1 ITEM.




-- 26) MOST USED PAYMENT METHOD

SELECT op.payment_type, COUNT(*) AS payment_method
FROM orders o 
JOIN order_payments op ON
o.order_id = op.order_id
WHERE o.order_status = 'delivered'
GROUP BY op.payment_type
ORDER BY payment_method DESC;

/** ANS - 	credit_card (74586) is the most used, followed by
	boleto (19191), voucher (5493) and debit_card (1486). **/





-- 27) CATEGORY REVIEWS

/** NOTE - THE REVIEW SCORE IS RANKED FROM 1 (WORST) TO 5 (BEST)
IF THE RANK IS LESS THAN 3, IT IS NOT RECOMMENDED
IF THE RANK IS GREATER OR EQUAL TO 3, IT IS RECOMMENDED **/

-- Ai) POSITIVE AND NEGATIVE REVIEWS PER CATEGORY

SELECT  pc.product_category_name_english AS category_by_english_name,
        SUM(CASE 
                WHEN ore.review_score >= 3 THEN 1
                ELSE 0 END) AS positive_reviews,
        SUM(CASE 
                WHEN ore.review_score < 3 THEN 1
                ELSE 0 END) AS negative_reviews
FROM order_reviews ore
JOIN orders o 
        ON o.order_id = ore.order_id
JOIN order_items oi
        ON o.order_id = oi.order_id
JOIN products p
        ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation pc
        ON p.product_category_name = pc.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY pc.product_category_name_english
ORDER BY positive_reviews DESC;

/** FOR ALL 72 PRODUCT CATEGORY DELIVERED, THEY ALL HAVE POSITIVE REVIEWS GREATER THAN THEIR NEGATIVE REVIEWS EXCEPT FOR security_and_services CATEGORY, WHICH HAS 1 POSITIVE AND 1 NEGATIVE REVIEW. **/

SELECT  pc.product_category_name_english AS category_by_english_name,
        SUM(CASE 
                WHEN ore.review_score >= 3 THEN 1
                ELSE 0 END) AS positive_reviews,
        SUM(CASE 
                WHEN ore.review_score < 3 THEN 1
                ELSE 0 END) AS negative_reviews
FROM order_reviews ore
JOIN orders o 
        ON o.order_id = ore.order_id
JOIN order_items oi
        ON o.order_id = oi.order_id
JOIN products p
        ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation pc
        ON p.product_category_name = pc.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY pc.product_category_name_english 
HAVING positive_reviews = negative_reviews
ORDER BY positive_reviews DESC ;

-- Aii) CATEGORIES WITH NO NEGATIVE REVIEWS.

-- 2 CATEGORIES (cds_dvds_musicals and fashion_childrens_clothes) HAS NO NEGATIVE REVIEW. 

SELECT  pc.product_category_name_english AS category_by_english_name,
        SUM(CASE 
                WHEN ore.review_score >= 3 THEN 1
                ELSE 0 END) AS positive_reviews,
        SUM(CASE 
                WHEN ore.review_score < 3 THEN 1
                ELSE 0 END) AS negative_reviews
FROM order_reviews ore
JOIN orders o 
        ON o.order_id = ore.order_id
JOIN order_items oi
        ON o.order_id = oi.order_id
JOIN products p
        ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation pc
        ON p.product_category_name = pc.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY pc.product_category_name_english 
HAVING negative_reviews = 0
ORDER BY positive_reviews DESC ;

/** LIMITATIONS - I COULD NOT CREATE STORED PROCEDURES AND FUCTIONS BECAUSE IT IS AN SQLITE FILE.

CONCLUSION - WHEN SELLERS AND BUYERS ARE REGISTERING, THERE SHOULD BE A DROP-DOWN SECTION FOR SELECTING CITIES, THEY CAN CHOOSE CITIES BASED ON THIER LOCATION OR LOCATION CLOSEST TO THEM. THIS WOULD LIMIT DATA REDUNDANCY. THE PRODUCT NAME CATEGORY SHOULD ALSO HAVE THIS DROP-DOWN SECTION AS WELL, THERE SHOULD BE AN UNKNOWN CATEGORY TO SAVE PRODUCTS THAT CAN'T BE DESCRIBED IF NEED BE.  
**/
