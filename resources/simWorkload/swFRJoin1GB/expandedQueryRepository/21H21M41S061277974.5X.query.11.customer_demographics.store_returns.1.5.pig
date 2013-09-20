store_returns = LOAD 'pigData/store_returns.dat' using PigStorage('|') AS (sr_returned_date_sk:int, sr_return_time_sk:int, sr_item_sk:int, sr_customer_sk:int, sr_cdemo_sk:int, sr_hdemo_sk:int, sr_addr_sk:int, sr_store_sk:int, sr_reason_sk:int, sr_ticket_number:int, sr_return_quantity:int, sr_return_amt:double, sr_return_tax:double, sr_return_amt_inc_tax:double, sr_fee:double, sr_return_ship_cost:double, sr_refunded_cash:double, sr_reversed_charge:double, sr_store_credit:double, sr_net_loss:double);

customer_demographics = LOAD 'pigData/customer_demographics.dat' using PigStorage('|') AS (cd_demo_sk:int, cd_gender:chararray, cd_marital_status:chararray, cd_education_status:chararray, cd_purchase_estimate:int, cd_credit_rating:chararray, cd_dep_count:int, cd_dep_employed_count:int, cd_dep_college_count:int);

proy_storeReturns = FOREACH store_returns GENERATE sr_cdemo_sk;
proy_cDemo = FOREACH customer_demographics GENERATE cd_demo_sk;

join_cDemo_storeReturns = JOIN proy_cDemo BY cd_demo_sk, proy_storeReturns BY sr_cdemo_sk USING 'replicated';

STORE join_cDemo_storeReturns INTO 'queryResults/query.11.customer_demographics.store_returns.1.5' using PigStorage('|');

rm queryResults/query.11.customer_demographics.store_returns.1.5;

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

