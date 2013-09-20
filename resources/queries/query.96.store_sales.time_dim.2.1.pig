store_sales = LOAD 'pigData/store_sales.dat' using PigStorage('|') AS (ss_sold_date_sk:int, ss_sold_time_sk:int, ss_item_sk:int, ss_customer_sk:int, ss_cdemo_sk:int, ss_hdemo_sk:int, ss_addr_sk:int, ss_store_sk:int, ss_promo_sk:int, ss_ticket_number:int, ss_quantity:int, ss_wholesale_cost:double, ss_list_price:double, ss_sales_price:double, ss_ext_discount_amt:double, ss_ext_sales_price:double, ss_ext_wholesale_cost:double, ss_ext_list_price:double, ss_ext_tax:double, ss_coupon_amt:double, ss_net_paid:double, ss_net_paid_inc_tax:double, ss_net_profit:double);

time_dim = LOAD 'pigData/time_dim.dat' using PigStorage('|') AS (t_time_sk:int, t_time_id:chararray, t_time:int, t_hour:int, t_minute:int, t_second:int, t_am_pm:chararray, t_shift:chararray, t_sub_shift:chararray, t_meal_time:chararray);

ss_proy = FOREACH store_sales GENERATE ss_sold_time_sk;
td_proy = FOREACH time_dim GENERATE t_hour, t_minute, t_time_sk;

query96_TdSs = JOIN ss_proy BY ss_sold_time_sk, td_proy BY t_time_sk USING 'replicated';

STORE query96_TdSs INTO 'queryResults/query.96.store_sales.time_dim.2.1' USING PigStorage('|');

rm queryResults/query.96.store_sales.time_dim.2.1;

-- start query 1 in stream 0 using template query96.tpl
--select top 100 count(*)
--from store_sales
--    ,household_demographics
--    ,time_dim, store
--where ss_sold_time_sk = time_dim.t_time_sk
--    and ss_hdemo_sk = household_demographics.hd_demo_sk
--    and ss_store_sk = s_store_sk
--    and time_dim.t_hour = 8
--    and time_dim.t_minute >= 30
--    and household_demographics.hd_dep_count = 2
--    and store.s_store_name = 'ese'
--order by count(*)
--;
-- end query 1 in stream 0 using template query96.tpl
