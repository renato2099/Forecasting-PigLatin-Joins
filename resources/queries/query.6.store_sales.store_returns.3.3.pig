store_returns = LOAD 'pigData/store_returns.dat' using PigStorage('|') AS (sr_returned_date_sk:int, sr_return_time_sk:int, sr_item_sk:int, sr_customer_sk:int, sr_cdemo_sk:int, sr_hdemo_sk:int, sr_addr_sk:int, sr_store_sk:int, sr_reason_sk:int, sr_ticket_number:int, sr_return_quantity:int, sr_return_amt:double, sr_return_tax:double, sr_return_amt_inc_tax:double, sr_fee:double, sr_return_ship_cost:double, sr_refunded_cash:double, sr_reversed_charge:double, sr_store_credit:double, sr_net_loss:double);

store_sales = LOAD 'pigData/store_sales.dat' using PigStorage('|') AS (ss_sold_date_sk:int, ss_sold_time_sk:int, ss_item_sk:int, ss_customer_sk:int, ss_cdemo_sk:int, ss_hdemo_sk:int, ss_addr_sk:int, ss_store_sk:int, ss_promo_sk:int, ss_ticket_number:int, ss_quantity:int, ss_wholesale_cost:double, ss_list_price:double, ss_sales_price:double, ss_ext_discount_amt:double, ss_ext_sales_price:double, ss_ext_wholesale_cost:double, ss_ext_list_price:double, ss_ext_tax:double, ss_coupon_amt:double, ss_net_paid:double, ss_net_paid_inc_tax:double, ss_net_profit:double);

proy_storeReturns = FOREACH store_returns GENERATE sr_item_sk;
proy_storeSales = FOREACH store_sales GENERATE ss_item_sk;

join_storeReturns_storeSales = JOIN proy_storeSales BY ss_item_sk, proy_storeReturns BY sr_item_sk USING 'replicated';

STORE join_storeReturns_storeSales INTO 'queryResults/query.6.store_sales.store_returns.3.3' using PigStorage('|');

rm queryResults/query.6.store_sales.store_returns.3.3;

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

