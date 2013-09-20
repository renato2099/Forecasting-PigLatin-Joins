store_returns = LOAD 'pigData/store_returns.dat' using PigStorage('|') AS (sr_returned_date_sk:int, sr_return_time_sk:int, sr_item_sk:int, sr_customer_sk:int, sr_cdemo_sk:int, sr_hdemo_sk:int, sr_addr_sk:int, sr_store_sk:int, sr_reason_sk:int, sr_ticket_number:int, sr_return_quantity:int, sr_return_amt:double, sr_return_tax:double, sr_return_amt_inc_tax:double, sr_fee:double, sr_return_ship_cost:double, sr_refunded_cash:double, sr_reversed_charge:double, sr_store_credit:double, sr_net_loss:double);

store_dim = LOAD 'pigData/store.dat' using PigStorage('|') AS (s_store_sk:int, s_store_id:chararray, s_rec_start_date:chararray, s_rec_end_date:chararray, s_closed_date_sk:int, s_store_name:chararray, s_number_employees:int, s_floor_space:int, s_hours:chararray, S_manager:chararray, S_market_id:int, S_geography_class:chararray, S_market_desc:chararray, s_market_manager:chararray, s_division_id:int, s_division_name:chararray, s_company_id:int, s_company_name:chararray, s_street_number:chararray, s_street_name:chararray, s_street_type:chararray, s_suite_number:chararray, s_city:chararray, s_county:chararray, s_state:chararray, s_zip:chararray, s_country:chararray, s_gmt_offset:double, s_tax_percentage:double);

proy_storeReturns = FOREACH store_returns GENERATE sr_store_sk;
proy_store = FOREACH store_dim GENERATE s_store_sk;

join_store_storeReturns = JOIN proy_store BY s_store_sk, proy_storeReturns BY sr_store_sk USING 'replicated';

STORE join_store_storeReturns INTO 'queryResults/query.11.store.store_returns.1.8' using PigStorage('|');

rm queryResults/query.11.store.store_returns.1.8;

--select top 100 dt.d_year
 --       ,item.i_brand_id brand_id
 --       ,item.i_brand brand
--        ,sum(ss_ext_sales_price) ext_price
-- from date_dim dt
--     ,store_sales
--     ,item
-- where dt.d_date_sk = store_sales.ss_sold_date_sk
--    and store_sales.ss_item_sk = item.i_item_sk
--    and item.i_manager_id = 1
--    and dt.d_moy=12
--    and dt.d_year=1999
-- group by dt.d_year
--        ,item.i_brand
--        ,item.i_brand_id
-- order by dt.d_year
--        ,ext_price desc
--        ,brand_id
-- ;

