store_sales = LOAD 'pigData/store_sales.dat' using PigStorage('|') AS (ss_sold_date_sk:int, ss_sold_time_sk:int, ss_item_sk:int, ss_customer_sk:int, ss_cdemo_sk:int, ss_hdemo_sk:int, ss_addr_sk:int, ss_store_sk:int, ss_promo_sk:int, ss_ticket_number:int, ss_quantity:int, ss_wholesale_cost:double, ss_list_price:double, ss_sales_price:double, ss_ext_discount_amt:double, ss_ext_sales_price:double, ss_ext_wholesale_cost:double, ss_ext_list_price:double, ss_ext_tax:double, ss_coupon_amt:double, ss_net_paid:double, ss_net_paid_inc_tax:double, ss_net_profit:double);

date_dim = LOAD 'pigData/date_dim.dat' using PigStorage('|') AS (d_date_sk:int, d_date_id:chararray, d_date:chararray, d_month_seq:int, d_week_seq:int, d_quarter_seq:int, d_year:int, d_dow:int, d_moy:int, d_dom:int, d_qoy:int, d_fy_year:int, d_fy_quarter_seq:int, d_fy_week_seq:int, d_day_name:chararray, d_quarter_name:chararray, d_holiday:chararray, d_weekend:chararray, d_following_holiday:chararray, d_first_dom:int, d_last_dom:int, d_same_day_ly:int, d_same_day_lq:int, d_current_day:chararray, d_current_week:chararray, d_current_month:chararray, d_current_quarter:chararray, d_current_year:chararray);

ss_proy = FOREACH store_sales GENERATE ss_sold_date_sk;

dd_proy = FOREACH date_dim GENERATE d_date_sk, d_year;

dd_filter = FILTER dd_proy BY d_year == 2001;

query7DdSs = JOIN dd_filter BY d_date_sk, ss_proy BY ss_sold_date_sk;

STORE query7DdSs INTO 'queryResults/query.7.date_dim.store_sales.1.1' USING PigStorage('|');


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
