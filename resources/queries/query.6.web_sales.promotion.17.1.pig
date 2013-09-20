web_sales = LOAD 'pigData/web_sales.dat' using PigStorage('|') AS (ws_sold_date_sk:int, ws_sold_time_sk:int, ws_ship_date_sk:int, ws_item_sk:int,ws_bill_customer_sk:int, ws_bill_cdemo_sk:int, ws_bill_hdemo_sk:int, ws_bill_addr_sk:int, ws_ship_customer_sk:int, ws_ship_cdemo_sk:int, ws_ship_hdemo_sk:int, ws_ship_addr_sk:int, ws_web_page_sk:int, ws_web_site_sk:int, ws_ship_mode_sk:int, ws_warehouse_sk:int, ws_promo_sk:int, ws_order_number:int, ws_quantity:int, ws_wholesale_cost:double, ws_list_price:double, ws_sales_price:double, ws_ext_discount_amt:double, ws_ext_sales_price:double, ws_ext_wholesale_cost:double, ws_ext_list_price:double, ws_ext_tax:double, ws_coupon_amt:double, ws_ext_ship_cost:double, ws_net_paid:double, ws_net_paid_inc_tax:double, ws_net_paid_inc_ship:double, ws_net_paid_inc_ship_tax:double, ws_net_profit:double);

promotion = LOAD 'pigData/promotion.dat' using PigStorage('|') AS (p_promo_sk:int, p_promo_id:chararray, p_start_date_sk:int, p_end_date_sk:int, p_item_sk:int, p_cost:double, p_response_target:int, p_promo_name:chararray, p_channel_dmail:chararray, p_channel_email:chararray, p_channel_catalog:chararray, p_channel_tv:chararray, p_channel_radio:chararray, p_channel_press:chararray, p_channel_event:chararray, p_channel_demo:chararray, p_channel_details:chararray, p_purpose:chararray, p_discount_active:chararray);

proy_webSales = FOREACH web_sales GENERATE ws_promo_sk;
proy_promotion = FOREACH promotion GENERATE p_promo_sk;

join_webSales_promotion = JOIN proy_webSales BY ws_promo_sk, proy_promotion BY p_promo_sk;

STORE join_webSales_promotion INTO 'queryResults/query.6.web_sales.promotion.17.1' USING PigStorage('|');

rm queryResults/query.6.web_sales.promotion.17.1;

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
