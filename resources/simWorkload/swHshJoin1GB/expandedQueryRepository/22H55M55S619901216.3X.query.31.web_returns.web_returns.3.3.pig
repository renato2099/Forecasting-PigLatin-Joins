web_returns = LOAD 'pigData/web_site.dat' using PigStorage('|') AS (wr_returned_date_sk:int, wr_returned_time_sk:int, wr_item_sk:int, wr_refunded_customer_sk:int, wr_refunded_cdemo_sk:int, wr_refunded_hdemo_sk:int, wr_refunded_addr_sk:int, wr_returning_customer_sk:int, wr_returning_cdemo_sk:int, wr_returning_hdemo_sk:int, wr_returning_addr_sk:int, wr_web_page_sk:int, wr_reason_sk:int, wr_order_number:int, wr_return_quantity:int, wr_return_amt:double, wr_return_tax:double, wr_return_amt_inc_tax:double, wr_fee:double, wr_return_ship_cost:double, wr_refunded_cash:double, wr_reversed_charge:double, wr_account_credit:double, wr_net_loss:double);

web_returns2 = LOAD 'pigData/web_site.dat' using PigStorage('|') AS (wr_returned_date_sk:int, wr_returned_time_sk:int, wr_item_sk:int, wr_refunded_customer_sk:int, wr_refunded_cdemo_sk:int, wr_refunded_hdemo_sk:int, wr_refunded_addr_sk:int, wr_returning_customer_sk:int, wr_returning_cdemo_sk:int, wr_returning_hdemo_sk:int, wr_returning_addr_sk:int, wr_web_page_sk:int, wr_reason_sk:int, wr_order_number:int, wr_return_quantity:int, wr_return_amt:double, wr_return_tax:double, wr_return_amt_inc_tax:double, wr_fee:double, wr_return_ship_cost:double, wr_refunded_cash:double, wr_reversed_charge:double, wr_account_credit:double, wr_net_loss:double);

proy_webReturns = FOREACH web_returns GENERATE wr_item_sk;
proy_webReturns2 = FOREACH web_returns2 GENERATE wr_item_sk;

join_webReturns_webReturns2 = JOIN proy_webReturns BY wr_item_sk, proy_webReturns2 BY wr_item_sk;

STORE join_webReturns_webReturns2 INTO 'queryResults/query.31.web_returns.web_returns.3.3' USING PigStorage('|');

rm queryResults/query.31.web_returns.web_returns.3.3;

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
