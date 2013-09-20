store_sales = LOAD 'pigData/store_sales.dat' using PigStorage('|') AS (ss_sold_date_sk:int, ss_sold_time_sk:int, ss_item_sk:int, ss_customer_sk:int, ss_cdemo_sk:int, ss_hdemo_sk:int, ss_addr_sk:int, ss_store_sk:int, ss_promo_sk:int, ss_ticket_number:int, ss_quantity:int, ss_wholesale_cost:double, ss_list_price:double, ss_sales_price:double, ss_ext_discount_amt:double, ss_ext_sales_price:double, ss_ext_wholesale_cost:double, ss_ext_list_price:double, ss_ext_tax:double, ss_coupon_amt:double, ss_net_paid:double, ss_net_paid_inc_tax:double, ss_net_profit:double);

household_demographics = LOAD 'pigData/household_demographics.dat' using PigStorage('|') AS (hd_demo_sk:int, hd_income_band_sk:int, hd_buy_potential:chararray, hd_dep_count:int, hd_vehicle_count:int);

ss_proy = FOREACH store_sales GENERATE ss_hdemo_sk;

hd_proy = FOREACH household_demographics GENERATE hd_demo_sk;

query96_HdSs = JOIN hd_proy BY hd_demo_sk, ss_proy BY ss_hdemo_sk;

STORE query96_HdSs INTO 'queryResults/query.96.household_demographics.store_sales.1.6' USING PigStorage('|');

rm queryResults/query.96.household_demographics.store_sales.1.6;

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
