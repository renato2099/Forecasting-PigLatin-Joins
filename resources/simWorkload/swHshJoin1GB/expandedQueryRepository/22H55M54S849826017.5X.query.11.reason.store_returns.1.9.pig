store_returns = LOAD 'pigData/store_returns.dat' using PigStorage('|') AS (sr_returned_date_sk:int, sr_return_time_sk:int, sr_item_sk:int, sr_customer_sk:int, sr_cdemo_sk:int, sr_hdemo_sk:int, sr_addr_sk:int, sr_store_sk:int, sr_reason_sk:int, sr_ticket_number:int, sr_return_quantity:int, sr_return_amt:double, sr_return_tax:double, sr_return_amt_inc_tax:double, sr_fee:double, sr_return_ship_cost:double, sr_refunded_cash:double, sr_reversed_charge:double, sr_store_credit:double, sr_net_loss:double);

reason = LOAD 'pigData/reason.dat' using PigStorage('|') AS (r_reason_sk:int, r_reason_id:chararray, r_reason_desc:chararray);

proy_storeReturns = FOREACH store_returns GENERATE sr_reason_sk;
proy_reason = FOREACH reason GENERATE r_reason_sk;

join_reason_storeReturns = JOIN proy_reason BY r_reason_sk, proy_storeReturns BY sr_reason_sk;

STORE join_reason_storeReturns INTO 'queryResults/query.11.reason.store_returns.1.9' using PigStorage('|');

rm queryResults/query.11.reason.store_returns.1.9;

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

