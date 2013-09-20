web_site = LOAD 'pigData/web_site.dat' using PigStorage('|') AS (web_site_sk:int, web_site_id:chararray, web_rec_start_date:int, web_rec_end_date:int, web_name:chararray, web_open_date_sk:int, web_close_date_sk:int, web_class:chararray, web_manager:chararray, web_mkt_id:int, web_mkt_class:chararray, web_mkt_desc:chararray, web_market_manager:chararray, web_company_id:int, web_company_name:chararray, web_street_number:chararray, web_street_name:chararray, web_street_type:chararray, web_suite_number:chararray, web_city:chararray, web_county:chararray, web_state:chararray, web_zip:chararray, web_country:chararray, web_gmt_offset:double, web_tax_percentage:double);

web_site2 = LOAD 'pigData/web_site.dat' using PigStorage('|') AS (web_site_sk:int, web_site_id:chararray, web_rec_start_date:int, web_rec_end_date:int, web_name:chararray, web_open_date_sk:int, web_close_date_sk:int, web_class:chararray, web_manager:chararray, web_mkt_id:int, web_mkt_class:chararray, web_mkt_desc:chararray, web_market_manager:chararray, web_company_id:int, web_company_name:chararray, web_street_number:chararray, web_street_name:chararray, web_street_type:chararray, web_suite_number:chararray, web_city:chararray, web_county:chararray, web_state:chararray, web_zip:chararray, web_country:chararray, web_gmt_offset:double, web_tax_percentage:double);

proy_webSite = FOREACH web_site GENERATE web_site_sk;
proy_webSite2 = FOREACH web_site2 GENERATE web_site_sk;

joinWebSiteWebSite2 = JOIN proy_webSite BY web_site_sk, proy_webSite2 BY web_site_sk USING 'merge';

STORE joinWebSiteWebSite2 INTO 'queryResults/query.75.web_site.web_site.1.1' USING PigStorage('|');

rm queryResults/query.75.web_site.web_site.1.1;

--SELECT d_year
--             ,i_brand_id
--             ,i_class_id
--             ,i_category_id
--             ,i_manufact_id
--             ,ws_quantity - COALESCE(wr_return_quantity,0) AS sales_cnt
--             ,ws_ext_sales_price - COALESCE(wr_return_amt,0.0) AS sales_amt
--       FROM web_sales JOIN item ON i_item_sk=ws_item_sk
--                      JOIN date_dim ON d_date_sk=ws_sold_date_sk
--                      LEFT JOIN web_returns ON (ws_order_number=wr_order_number
--                                            AND ws_item_sk=wr_item_sk)
--       WHERE i_category='Music'
