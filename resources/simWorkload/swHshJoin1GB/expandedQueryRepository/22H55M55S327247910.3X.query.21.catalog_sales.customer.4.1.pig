catalog_sales = LOAD 'pigData/catalog_sales.dat' using PigStorage('|') AS (cs_sold_date_sk:int, cs_sold_time_sk:int, cs_ship_date_sk:int, cs_bill_customer_sk:int, cs_bill_cdemo_sk:int, cs_bill_hdemo_sk:int, cs_bill_addr_sk:int, cs_ship_customer_sk:int,cs_ship_cdemo_sk:int, cs_ship_hdemo_sk:int,cs_ship_addr_sk:int, cs_call_center_sk:int,cs_catalog_page_sk:int, cs_ship_mode_sk:int,cs_warehouse_sk:int, cs_item_sk:int,cs_promo_sk:int,cs_order_number:int, cs_quantity:int,cs_wholesale_cost:double, cs_list_price:double, cs_sales_price:double, cs_ext_discount_amt:double, cs_ext_sales_price:double, cs_ext_wholesale_cost:double, cs_ext_list_price:double, cs_ext_tax:double, cs_coupon_amt:double, cs_ext_ship_cost:double, cs_net_paid:double, cs_net_paid_inc_tax:double, cs_net_paid_inc_ship:double, cs_net_paid_inc_ship_tax:double, cs_net_profit:double);

customer = LOAD 'pigData/customer.dat' using PigStorage('|') AS (c_customer_sk:int, c_customer_id:chararray, c_current_cdemo_sk:int, c_current_hdemo_sk:int, c_current_addr_sk:int, c_first_shipto_date_sk:int, c_first_sales_date_sk:int, c_salutation:chararray, c_first_name:chararray, c_last_name:chararray, c_preferred_cust_flag:chararray, c_birth_day:int, c_birth_month:int, c_birth_year:int, c_birth_country:chararray, c_login:chararray, c_email_address:chararray, c_last_review_date_sk:int);

proy_catalogSales = FOREACH catalog_sales GENERATE cs_bill_customer_sk;
proy_customer = FOREACH customer GENERATE c_customer_sk;

join_catSales_customer = JOIN proy_catalogSales BY cs_bill_customer_sk, proy_customer BY c_customer_sk;

STORE join_catSales_customer INTO 'queryResults/query.20.catalog_sales.customer.4.1' using PigStorage('|');

rm queryResults/query.20.catalog_sales.customer.4.1;

-- start query 65 in stream 0 using template query20.tpl
--select top 100 i_item_desc
--       ,i_category
--       ,i_class
--       ,i_current_price
--       ,sum(cs_ext_sales_price) as itemrevenue
--       ,sum(cs_ext_sales_price)*100/sum(sum(cs_ext_sales_price)) over
--           (partition by i_class) as revenueratio
-- from   catalog_sales
--     ,item
--     ,date_dim
-- where cs_item_sk = i_item_sk
--   and i_category in ('Shoes', 'Electronics', 'Home')
--   and cs_sold_date_sk = d_date_sk
-- and d_date between cast('2001-06-21' as date)
--                               and (cast('2001-06-21' as date) + 30 days)
-- group by i_item_id
--         ,i_item_desc
--         ,i_category
--         ,i_class
--         ,i_current_price
-- order by i_category
--         ,i_class
--         ,i_item_id
--         ,i_item_desc
--         ,revenueratio
--;
-- end query 65 in stream 0 using template query20.tpl

