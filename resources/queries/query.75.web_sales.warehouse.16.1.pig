web_sales = LOAD 'pigData/web_sales.dat' using PigStorage('|') AS (ws_sold_date_sk:int, ws_sold_time_sk:int, ws_ship_date_sk:int, ws_item_sk:int,ws_bill_customer_sk:int, ws_bill_cdemo_sk:int, ws_bill_hdemo_sk:int, ws_bill_addr_sk:int, ws_ship_customer_sk:int, ws_ship_cdemo_sk:int, ws_ship_hdemo_sk:int, ws_ship_addr_sk:int, ws_web_page_sk:int, ws_web_site_sk:int, ws_ship_mode_sk:int, ws_warehouse_sk:int, ws_promo_sk:int, ws_order_number:int, ws_quantity:int, ws_wholesale_cost:double, ws_list_price:double, ws_sales_price:double, ws_ext_discount_amt:double, ws_ext_sales_price:double, ws_ext_wholesale_cost:double, ws_ext_list_price:double, ws_ext_tax:double, ws_coupon_amt:double, ws_ext_ship_cost:double, ws_net_paid:double, ws_net_paid_inc_tax:double, ws_net_paid_inc_ship:double, ws_net_paid_inc_ship_tax:double, ws_net_profit:double);

warehouse = LOAD 'pigData/warehouse.dat' using PigStorage('|') AS (w_warehouse_sk:int, w_warehouse_id:chararray, w_warehouse_name:chararray, w_warehouse_sq_ft:int, w_street_number:chararray, w_street_name:chararray, w_street_type:chararray, w_suite_number:chararray, w_city:chararray, w_county:chararray, w_state:chararray, w_zip:chararray, w_country:chararray, w_gmt_offset:double);

proy_webSales = FOREACH web_sales GENERATE ws_warehouse_sk;
proy_warehouse = FOREACH warehouse GENERATE w_warehouse_sk;

joinWebSalesWarehouse = JOIN proy_webSales BY ws_warehouse_sk, proy_warehouse BY w_warehouse_sk;

STORE joinWebSalesWarehouse INTO 'queryResults/query.75.web_sales.warehouse.16.1' USING PigStorage('|');

rm queryResults/query.75.web_sales.warehouse.16.1;

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
