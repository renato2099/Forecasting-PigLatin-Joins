store_sales = LOAD 'pigData/store_sales.dat' using PigStorage('|') AS (ss_sold_date_sk:int, ss_sold_time_sk:int, ss_item_sk:int, ss_customer_sk:int, ss_cdemo_sk:int, ss_hdemo_sk:int, ss_addr_sk:int, ss_store_sk:int, ss_promo_sk:int, ss_ticket_number:int, ss_quantity:int, ss_wholesale_cost:double, ss_list_price:double, ss_sales_price:double, ss_ext_discount_amt:double, ss_ext_sales_price:double, ss_ext_wholesale_cost:double, ss_ext_list_price:double, ss_ext_tax:double, ss_coupon_amt:double, ss_net_paid:double, ss_net_paid_inc_tax:double, ss_net_profit:double);

customer_demographics = LOAD 'pigData/customer_demographics.dat' using PigStorage('|') AS ( cd_demo_sk:int,	cd_gender:chararray,	cd_marital_status:chararray, cd_education_status:chararray, cd_purchase_estimate:int, cd_credit_rating:chararray, cd_dep_count:int, cd_dep_employed_count:int, cd_dep_college_count:int);


--cd_filter = FILTER customer_demographics BY (cd_gender == 'F') AND (cd_marital_status == 'M') AND (cd_education_status == 'College');
cd_proy = FOREACH customer_demographics GENERATE cd_demo_sk;
ss_proy = FOREACH store_sales GENERATE ss_cdemo_sk;

query7_CdSs = JOIN cd_proy BY cd_demo_sk, ss_proy BY ss_cdemo_sk;

STORE query7_CdSs INTO 'queryResults/query7_CdSs' USING PigStorage('|');

rm queryResults/query7_CdSs;

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
