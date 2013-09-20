web_sales = LOAD 'pigData/web_sales.dat' using PigStorage('|') AS (ws_sold_date_sk:int, ws_sold_time_sk:int, ws_ship_date_sk:int, ws_item_sk:int,ws_bill_customer_sk:int, ws_bill_cdemo_sk:int, ws_bill_hdemo_sk:int, ws_bill_addr_sk:int, ws_ship_customer_sk:int, ws_ship_cdemo_sk:int, ws_ship_hdemo_sk:int, ws_ship_addr_sk:int, ws_web_page_sk:int, ws_web_site_sk:int, ws_ship_mode_sk:int, ws_warehouse_sk:int, ws_promo_sk:int, ws_order_number:int, ws_quantity:int, ws_wholesale_cost:double, ws_list_price:double, ws_sales_price:double, ws_ext_discount_amt:double, ws_ext_sales_price:double, ws_ext_wholesale_cost:double, ws_ext_list_price:double, ws_ext_tax:double, ws_coupon_amt:double, ws_ext_ship_cost:double, ws_net_paid:double, ws_net_paid_inc_tax:double, ws_net_paid_inc_ship:double, ws_net_paid_inc_ship_tax:double, ws_net_profit:double);

web_returns = LOAD 'pigData/web_site.dat' using PigStorage('|') AS (wr_returned_date_sk:int, wr_returned_time_sk:int, wr_item_sk:int, wr_refunded_customer_sk:int, wr_refunded_cdemo_sk:int, wr_refunded_hdemo_sk:int, wr_refunded_addr_sk:int, wr_returning_customer_sk:int, wr_returning_cdemo_sk:int, wr_returning_hdemo_sk:int, wr_returning_addr_sk:int, wr_web_page_sk:int, wr_reason_sk:int, wr_order_number:int, wr_return_quantity:int, wr_return_amt:double, wr_return_tax:double, wr_return_amt_inc_tax:double, wr_fee:double, wr_return_ship_cost:double, wr_refunded_cash:double, wr_reversed_charge:double, wr_account_credit:double, wr_net_loss:double);

proy_webSales = FOREACH web_sales GENERATE ws_item_sk;
proy_webReturns = FOREACH web_returns GENERATE wr_item_sk;

join_webSales_webReturns = JOIN proy_webSales BY ws_item_sk, proy_webReturns BY wr_item_sk USING 'replicated';

STORE join_webSales_webReturns INTO 'queryResults/query6.web_sales.web_returns.4.3' USING PigStorage('|');

rm queryResults/query6.web_sales.web_returns.4.3;

-- select  web_site_id,
--          sum(ws_ext_sales_price) as sales,
--          sum(coalesce(wr_return_amt, 0)) as returns,
--           sum(ws_net_profit - coalesce(wr_net_loss, 0)) as profit
-- from web_sales 
--  		left outer join web_returns on (ws_item_sk = wr_item_sk and ws_order_number = wr_order_number),
--		date_dim,
--		web_site,
--		item,
--		promotion
-- where ws_sold_date_sk = d_date_sk
--       and d_date between cast('2002-08-19' as date)
--       and (cast('2002-08-19' as date) +  30 days)
--       and ws_web_site_sk = web_site_sk
