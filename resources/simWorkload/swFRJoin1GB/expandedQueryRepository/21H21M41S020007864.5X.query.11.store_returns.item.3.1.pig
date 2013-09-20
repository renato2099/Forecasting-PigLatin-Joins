store_returns = LOAD 'pigData/store_returns.dat' using PigStorage('|') AS (sr_returned_date_sk:int, sr_return_time_sk:int, sr_item_sk:int, sr_customer_sk:int, sr_cdemo_sk:int, sr_hdemo_sk:int, sr_addr_sk:int, sr_store_sk:int, sr_reason_sk:int, sr_ticket_number:int, sr_return_quantity:int, sr_return_amt:double, sr_return_tax:double, sr_return_amt_inc_tax:double, sr_fee:double, sr_return_ship_cost:double, sr_refunded_cash:double, sr_reversed_charge:double, sr_store_credit:double, sr_net_loss:double);

item = LOAD 'pigData/item.dat' using PigStorage('|') AS (i_item_sk:int, i_item_id:chararray, i_rec_start_date:chararray, i_rec_end_date:chararray, i_item_desc:chararray, i_current_price:double, i_wholesale_cost:double, i_brand_id:int, i_brand:chararray, i_class_id:int, i_class:chararray, i_category_id:int, i_category:chararray, i_manufact_id:int, i_manufact:chararray, i_size:chararray, i_formulation:chararray, i_color:chararray, i_units:chararray, i_container:chararray, i_manager_id:int, i_product_name:chararray);

proy_storeReturns = FOREACH store_returns GENERATE sr_item_sk;
proy_item = FOREACH item GENERATE i_item_sk;

join_item_storeReturns = JOIN proy_storeReturns BY sr_item_sk, proy_item BY i_item_sk USING 'replicated';

STORE join_item_storeReturns INTO 'queryResults/query.11.store_returns.item.3.1' using PigStorage('|');

rm queryResults/query.11.store_returns.item.3.1;

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

