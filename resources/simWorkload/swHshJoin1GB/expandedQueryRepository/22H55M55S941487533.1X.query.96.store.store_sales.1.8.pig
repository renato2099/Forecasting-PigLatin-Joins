store_sales = LOAD 'pigData/store_sales.dat' using PigStorage('|') AS (ss_sold_date_sk:int, ss_sold_time_sk:int, ss_item_sk:int, ss_customer_sk:int, ss_cdemo_sk:int, ss_hdemo_sk:int, ss_addr_sk:int, ss_store_sk:int, ss_promo_sk:int, ss_ticket_number:int, ss_quantity:int, ss_wholesale_cost:double, ss_list_price:double, ss_sales_price:double, ss_ext_discount_amt:double, ss_ext_sales_price:double, ss_ext_wholesale_cost:double, ss_ext_list_price:double, ss_ext_tax:double, ss_coupon_amt:double, ss_net_paid:double, ss_net_paid_inc_tax:double, ss_net_profit:double);

store_dim = LOAD 'pigData/store.dat' using PigStorage('|') AS (s_store_sk:int, s_store_id:chararray, s_rec_start_date:chararray, s_rec_end_date:chararray, s_closed_date_sk:int, s_store_name:chararray, s_number_employees:int, s_floor_space:int, s_hours:chararray, S_manager:chararray, S_market_id:int, S_geography_class:chararray, S_market_desc:chararray, s_market_manager:chararray, s_division_id:int, s_division_name:chararray, s_company_id:int, s_company_name:chararray, s_street_number:chararray, s_street_name:chararray, s_street_type:chararray, s_suite_number:chararray, s_city:chararray, s_county:chararray, s_state:chararray, s_zip:chararray, s_country:chararray, s_gmt_offset:double, s_tax_percentage:double);

ss_proy = FOREACH store_sales GENERATE ss_sold_time_sk, ss_store_sk;

sd_proy = FOREACH store_dim GENERATE s_store_sk, s_store_name;

sd_filter = FILTER sd_proy BY s_store_name matches 'ese';

query96_SdSs = JOIN sd_filter BY s_store_sk, ss_proy BY ss_store_sk;

STORE query96_SdSs INTO 'queryResults/query.96.store_dim.store_sales.1.8' USING PigStorage('|');

rm queryResults/query.96.store_dim.store_sales.1.8;

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
