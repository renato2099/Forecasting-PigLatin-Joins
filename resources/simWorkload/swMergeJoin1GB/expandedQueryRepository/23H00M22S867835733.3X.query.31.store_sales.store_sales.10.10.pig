store_sales = LOAD 'pigData/store_sales.dat' using PigStorage('|') AS (ss_sold_date_sk:int, ss_sold_time_sk:int, ss_item_sk:int, ss_customer_sk:int, ss_cdemo_sk:int, ss_hdemo_sk:int, ss_addr_sk:int, ss_store_sk:int, ss_promo_sk:int, ss_ticket_number:int, ss_quantity:int, ss_wholesale_cost:double, ss_list_price:double, ss_sales_price:double, ss_ext_discount_amt:double, ss_ext_sales_price:double, ss_ext_wholesale_cost:double, ss_ext_list_price:double, ss_ext_tax:double, ss_coupon_amt:double, ss_net_paid:double, ss_net_paid_inc_tax:double, ss_net_profit:double);

store_sales2 = LOAD 'pigData/store_sales.dat' using PigStorage('|') AS (ss_sold_date_sk:int, ss_sold_time_sk:int, ss_item_sk:int, ss_customer_sk:int, ss_cdemo_sk:int, ss_hdemo_sk:int, ss_addr_sk:int, ss_store_sk:int, ss_promo_sk:int, ss_ticket_number:int, ss_quantity:int, ss_wholesale_cost:double, ss_list_price:double, ss_sales_price:double, ss_ext_discount_amt:double, ss_ext_sales_price:double, ss_ext_wholesale_cost:double, ss_ext_list_price:double, ss_ext_tax:double, ss_coupon_amt:double, ss_net_paid:double, ss_net_paid_inc_tax:double, ss_net_profit:double);

ss_proy = FOREACH store_sales GENERATE ss_ticket_number;
ss_proy2 = FOREACH store_sales2 GENERATE ss_ticket_number;

join_storeSales_storeSales2 = JOIN ss_proy BY ss_ticket_number, ss_proy2 BY ss_ticket_number USING 'merge';

STORE join_storeSales_storeSales2 INTO 'queryResults/query.31.store_sales.store_sales.10.10' USING PigStorage('|');

rm queryResults/query.31.store_sales.store_sales.10.10;

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
