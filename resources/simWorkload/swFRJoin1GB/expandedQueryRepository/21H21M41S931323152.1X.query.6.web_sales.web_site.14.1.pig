web_sales = LOAD 'pigData/web_sales.dat' using PigStorage('|') AS (ws_sold_date_sk:int, ws_sold_time_sk:int, ws_ship_date_sk:int, ws_item_sk:int,ws_bill_customer_sk:int, ws_bill_cdemo_sk:int, ws_bill_hdemo_sk:int, ws_bill_addr_sk:int, ws_ship_customer_sk:int, ws_ship_cdemo_sk:int, ws_ship_hdemo_sk:int, ws_ship_addr_sk:int, ws_web_page_sk:int, ws_web_site_sk:int, ws_ship_mode_sk:int, ws_warehouse_sk:int, ws_promo_sk:int, ws_order_number:int, ws_quantity:int, ws_wholesale_cost:double, ws_list_price:double, ws_sales_price:double, ws_ext_discount_amt:double, ws_ext_sales_price:double, ws_ext_wholesale_cost:double, ws_ext_list_price:double, ws_ext_tax:double, ws_coupon_amt:double, ws_ext_ship_cost:double, ws_net_paid:double, ws_net_paid_inc_tax:double, ws_net_paid_inc_ship:double, ws_net_paid_inc_ship_tax:double, ws_net_profit:double);

web_site = LOAD 'pigData/web_site.dat' using PigStorage('|') AS (web_site_sk:int, web_site_id:chararray, web_rec_start_date:int, web_rec_end_date:int, web_name:chararray, web_open_date_sk:int, web_close_date_sk:int, web_class:chararray, web_manager:chararray, web_mkt_id:int, web_mkt_class:chararray, web_mkt_desc:chararray, web_market_manager:chararray, web_company_id:int, web_company_name:chararray, web_street_number:chararray, web_street_name:chararray, web_street_type:chararray, web_suite_number:chararray, web_city:chararray, web_county:chararray, web_state:chararray, web_zip:chararray, web_country:chararray, web_gmt_offset:double, web_tax_percentage:double);

proy_webSales = FOREACH web_sales GENERATE ws_web_site_sk;
proy_webSite = FOREACH web_site GENERATE web_site_sk;

join_webSales_webSite = JOIN proy_webSales BY ws_web_site_sk, proy_webSite BY web_site_sk USING 'replicated';

STORE join_webSales_webSite INTO 'queryResults/query6.web_sales.web_site.14.1' USING PigStorage('|');

rm queryResults/query6.web_sales.web_site.14.1;

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
