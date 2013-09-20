promotion = LOAD 'pigData/promotion.dat' using PigStorage('|') AS (p_promo_sk:int, p_promo_id:chararray, p_start_date_sk:int, p_end_date_sk:int, p_item_sk:int, p_cost:double, p_response_target:int, p_promo_name:chararray, p_channel_dmail:chararray, p_channel_email:chararray, p_channel_catalog:chararray, p_channel_tv:chararray, p_channel_radio:chararray, p_channel_press:chararray, p_channel_event:chararray, p_channel_demo:chararray, p_channel_details:chararray, p_purpose:chararray, p_discount_active:chararray);

promotion2 = LOAD 'pigData/promotion.dat' using PigStorage('|') AS (p_promo_sk:int, p_promo_id:chararray, p_start_date_sk:int, p_end_date_sk:int, p_item_sk:int, p_cost:double, p_response_target:int, p_promo_name:chararray, p_channel_dmail:chararray, p_channel_email:chararray, p_channel_catalog:chararray, p_channel_tv:chararray, p_channel_radio:chararray, p_channel_press:chararray, p_channel_event:chararray, p_channel_demo:chararray, p_channel_details:chararray, p_purpose:chararray, p_discount_active:chararray);

proy_promotion = FOREACH promotion GENERATE p_promo_sk;
proy_promotion2 = FOREACH promotion2 GENERATE p_promo_sk;

join_promotion_promotion2 = JOIN proy_promotion BY p_promo_sk, proy_promotion2 BY p_promo_sk USING 'merge';

STORE join_promotion_promotion2 INTO 'queryResults/query.33.promotion.promotion.1.1' USING PigStorage('|');

rm queryResults/query.33.promotion.promotion.1.1;

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
