store_returns = LOAD 'pigData/store_returns.dat' using PigStorage('|') AS (sr_returned_date_sk:int, sr_return_time_sk:int, sr_item_sk:int, sr_customer_sk:int, sr_cdemo_sk:int, sr_hdemo_sk:int, sr_addr_sk:int, sr_store_sk:int, sr_reason_sk:int, sr_ticket_number:int, sr_return_quantity:int, sr_return_amt:double, sr_return_tax:double, sr_return_amt_inc_tax:double, sr_fee:double, sr_return_ship_cost:double, sr_refunded_cash:double, sr_reversed_charge:double, sr_store_credit:double, sr_net_loss:double);

customer_address = LOAD 'pigData/customer_address.dat' using PigStorage('|') AS (ca_address_sk:int, ca_address_id:chararray, ca_street_number:chararray, ca_street_name:chararray, ca_street_type:chararray, ca_suite_number:chararray, ca_city:chararray, ca_county:chararray, ca_state:chararray, ca_zip:chararray, ca_country:chararray, ca_gmt_offset:double, ca_location_type:chararray);

proy_storeReturns = FOREACH store_returns GENERATE sr_addr_sk;
proy_cAddress = FOREACH customer_address GENERATE ca_address_sk;

join_cAddress_storeReturns = JOIN proy_cAddress BY ca_address_sk, proy_storeReturns BY sr_addr_sk USING 'replicated';

STORE join_cAddress_storeReturns INTO 'queryResults/query.11.customer_address.store_returns.1.7' using PigStorage('|');

rm queryResults/query.11.customer_address.store_returns.1.7;

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

