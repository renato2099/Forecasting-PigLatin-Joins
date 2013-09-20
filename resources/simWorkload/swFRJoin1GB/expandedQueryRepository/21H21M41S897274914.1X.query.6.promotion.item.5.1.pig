promotion = LOAD 'pigData/promotion.dat' using PigStorage('|') AS (p_promo_sk:int, p_promo_id:chararray, p_start_date_sk:int, p_end_date_sk:int, p_item_sk:int, p_cost:double, p_response_target:int, p_promo_name:chararray, p_channel_dmail:chararray, p_channel_email:chararray, p_channel_catalog:chararray, p_channel_tv:chararray, p_channel_radio:chararray, p_channel_press:chararray, p_channel_event:chararray, p_channel_demo:chararray, p_channel_details:chararray, p_purpose:chararray, p_discount_active:chararray);

item = LOAD 'pigData/item.dat' using PigStorage('|') AS (i_item_sk:int, i_item_id:chararray, i_rec_start_date:chararray, i_rec_end_date:chararray, i_item_desc:chararray, i_current_price:double, i_wholesale_cost:double, i_brand_id:int, i_brand:chararray, i_class_id:int, i_class:chararray, i_category_id:int, i_category:chararray, i_manufact_id:int, i_manufact:chararray, i_size:chararray, i_formulation:chararray, i_color:chararray, i_units:chararray, i_container:chararray, i_manager_id:int, i_product_name:chararray);

proy_promotion = FOREACH promotion GENERATE p_item_sk;
proy_item = FOREACH item GENERATE i_item_sk;

join_promotion_item = JOIN proy_promotion BY p_item_sk, proy_item BY i_item_sk USING 'replicated';

STORE join_promotion_item INTO 'queryResults/query.6.promotion.item.5.1' USING PigStorage('|');

rm queryResults/query.6.promotion.item.5.1;

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
