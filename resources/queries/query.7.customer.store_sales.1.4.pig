store_sales = LOAD 'pigData/store_sales.dat' using PigStorage('|') AS (ss_sold_date_sk:int, ss_sold_time_sk:int, ss_item_sk:int, ss_customer_sk:int, ss_cdemo_sk:int, ss_hdemo_sk:int, ss_addr_sk:int, ss_store_sk:int, ss_promo_sk:int, ss_ticket_number:int, ss_quantity:int, ss_wholesale_cost:double, ss_list_price:double, ss_sales_price:double, ss_ext_discount_amt:double, ss_ext_sales_price:double, ss_ext_wholesale_cost:double, ss_ext_list_price:double, ss_ext_tax:double, ss_coupon_amt:double, ss_net_paid:double, ss_net_paid_inc_tax:double, ss_net_profit:double);

customer = LOAD 'pigData/customer.dat' using PigStorage('|') AS (c_customer_sk:int, c_customer_id:chararray, c_current_cdemo_sk:int, c_current_hdemo_sk:int, c_current_addr_sk:int, c_first_shipto_date_sk:int, c_first_sales_date_sk:int, c_salutation:chararray, c_first_name:chararray, c_last_name:chararray, c_preferred_cust_flag:chararray, c_birth_day:int, c_birth_month:int, c_birth_year:int, c_birth_country:chararray, c_login:chararray, c_email_address:chararray, c_last_review_date_sk:int);

customer_proy = FOREACH customer GENERATE c_customer_sk;

ss_proy = FOREACH store_sales GENERATE ss_customer_sk;

joinCustomerSSales = JOIN customer_proy BY c_customer_sk, ss_proy BY ss_customer_sk;

STORE joinCustomerSSales INTO 'queryResults/query.7.customer.store_sales.1.4' USING PigStorage('|');

rm queryResults/query.7.customer.store_sales.1.4;

-- start query 2 in stream 0 using template query7.tpl
--select top 100 i_item_id,
--        avg(ss_quantity) agg1,
--        avg(ss_list_price) agg2,
--        avg(ss_coupon_amt) agg3,
--        avg(ss_sales_price) agg4
-- from store_sales, customer_demographics, date_dim, item, promotion
-- where ss_sold_date_sk = d_date_sk and
--       ss_item_sk = i_item_sk and
--       ss_cdemo_sk = cd_demo_sk and
--       ss_promo_sk = p_promo_sk and
--       cd_gender = 'F' and
--       cd_marital_status = 'M' and
--       cd_education_status = 'College' and
--       (p_channel_email = 'N' or p_channel_event = 'N') and
--       d_year = 2001
-- group by i_item_id
-- order by i_item_id
--;
-- end query 2 in stream 0 using template query7.tpl
