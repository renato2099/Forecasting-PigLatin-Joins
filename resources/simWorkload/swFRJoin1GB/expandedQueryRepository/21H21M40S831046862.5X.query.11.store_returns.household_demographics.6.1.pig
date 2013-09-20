store_returns = LOAD 'pigData/store_returns.dat' using PigStorage('|') AS (sr_returned_date_sk:int, sr_return_time_sk:int, sr_item_sk:int, sr_customer_sk:int, sr_cdemo_sk:int, sr_hdemo_sk:int, sr_addr_sk:int, sr_store_sk:int, sr_reason_sk:int, sr_ticket_number:int, sr_return_quantity:int, sr_return_amt:double, sr_return_tax:double, sr_return_amt_inc_tax:double, sr_fee:double, sr_return_ship_cost:double, sr_refunded_cash:double, sr_reversed_charge:double, sr_store_credit:double, sr_net_loss:double);

household_demographics = LOAD 'pigData/household_demographics.dat' using PigStorage('|') AS (hd_demo_sk:int, hd_income_band_sk:int, hd_buy_potential:chararray, hd_dep_count:int, hd_vehicle_count:int);

proy_storeReturns = FOREACH store_returns GENERATE sr_hdemo_sk;
proy_hDemographics = FOREACH household_demographics GENERATE hd_demo_sk;

join_hDemographics_storeReturns = JOIN proy_storeReturns BY sr_hdemo_sk, proy_hDemographics BY hd_demo_sk USING 'replicated';

STORE join_hDemographics_storeReturns INTO 'queryResults/query.11.store_returns.household_demographics.6.1' using PigStorage('|');

rm queryResults/query.11.store_returns.household_demographics.6.1;

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

