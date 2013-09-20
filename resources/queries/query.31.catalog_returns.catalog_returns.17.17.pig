catalog_returns = LOAD 'pigData/catalog_returns.dat' using PigStorage('|') AS (cr_returned_date_sk:int, cr_returned_time_sk:int, cr_item_sk:int, cr_refunded_customer_sk:int, cr_refunded_cdemo_sk:int, cr_refunded_hdemo_sk:int, cr_refunded_addr_sk:int, cr_returning_customer_sk:int, cr_returning_cdemo_sk:int, cr_returning_hdemo_sk:int, cr_returning_addr_sk:int, cr_call_center_sk:int, cr_catalog_page_sk:int, cr_ship_mode_sk:int, cr_warehouse_sk:int, cr_reason_sk:int, cr_order_number:int, cr_return_quantity:int, cr_return_amount:double, cr_return_tax:double, cr_return_amt_inc_tax:double, cr_fee:double, cr_return_ship_cost:double, cr_refunded_cash:double, cr_reversed_charge:double, cr_store_credit:double, cr_net_loss:double);

catalog_returns2 = LOAD 'pigData/catalog_returns.dat' using PigStorage('|') AS (cr_returned_date_sk:int, cr_returned_time_sk:int, cr_item_sk:int, cr_refunded_customer_sk:int, cr_refunded_cdemo_sk:int, cr_refunded_hdemo_sk:int, cr_refunded_addr_sk:int, cr_returning_customer_sk:int, cr_returning_cdemo_sk:int, cr_returning_hdemo_sk:int, cr_returning_addr_sk:int, cr_call_center_sk:int, cr_catalog_page_sk:int, cr_ship_mode_sk:int, cr_warehouse_sk:int, cr_reason_sk:int, cr_order_number:int, cr_return_quantity:int, cr_return_amount:double, cr_return_tax:double, cr_return_amt_inc_tax:double, cr_fee:double, cr_return_ship_cost:double, cr_refunded_cash:double, cr_reversed_charge:double, cr_store_credit:double, cr_net_loss:double);

proy_catalogReturns = FOREACH catalog_returns GENERATE cr_order_number;
proy_catalogReturns2 = FOREACH catalog_returns2 GENERATE cr_order_number;

join_catalogReturns_catalogReturns2 = JOIN proy_catalogReturns BY cr_order_number, proy_catalogReturns2 BY cr_order_number;

STORE join_catalogReturns_catalogReturns2 INTO 'queryResults/query.31.catalog_returns.catalog_returns.17.17' using PigStorage('|');

rm queryResults/query.31.catalog_returns.catalog_returns.17.17;

-- start query 65 in stream 0 using template query20.tpl
--select top 100 i_item_desc
--       ,i_category
--       ,i_class
--       ,i_current_price
--       ,sum(cs_ext_sales_price) as itemrevenue
--       ,sum(cs_ext_sales_price)*100/sum(sum(cs_ext_sales_price)) over
--           (partition by i_class) as revenueratio
-- from   catalog_sales
--     ,item
--     ,date_dim
-- where cs_item_sk = i_item_sk
--   and i_category in ('Shoes', 'Electronics', 'Home')
--   and cs_sold_date_sk = d_date_sk
-- and d_date between cast('2001-06-21' as date)
--                               and (cast('2001-06-21' as date) + 30 days)
-- group by i_item_id
--         ,i_item_desc
--         ,i_category
--         ,i_class
--         ,i_current_price
-- order by i_category
--         ,i_class
--         ,i_item_id
--         ,i_item_desc
--         ,revenueratio
--;
-- end query 65 in stream 0 using template query20.tpl

