web_page = LOAD 'pigData/web_page.dat' USING PigStorage('|') AS (wp_web_page_sk:int, wp_web_page_id:chararray, wp_rec_start_date:chararray, wp_rec_end_date:chararray, wp_creation_date_sk:int, wp_access_date_sk:int, wp_autogen_flag:chararray, wp_customer_sk:int, wp_url:chararray, wp_type:chararray, wp_char_count:int, wp_link_count:int, wp_image_count:int, wp_max_ad_count:int);

web_page2 = LOAD 'pigData/web_page.dat' USING PigStorage('|') AS (wp_web_page_sk:int, wp_web_page_id:chararray, wp_rec_start_date:chararray, wp_rec_end_date:chararray, wp_creation_date_sk:int, wp_access_date_sk:int, wp_autogen_flag:chararray, wp_customer_sk:int, wp_url:chararray, wp_type:chararray, wp_char_count:int, wp_link_count:int, wp_image_count:int, wp_max_ad_count:int);

proy_webPage = FOREACH web_page GENERATE wp_web_page_id;
proy_webPage2 = FOREACH web_page2 GENERATE wp_web_page_id;

join_webPage_webPage2 = JOIN proy_webPage BY wp_web_page_id, proy_webPage2 BY wp_web_page_id USING 'replicated';

STORE join_webPage_webPage2 INTO 'queryResults/query.31.web_page.web_page.2.2' USING PigStorage('|');

rm queryResults/query.31.web_page.web_page.2.2;

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
