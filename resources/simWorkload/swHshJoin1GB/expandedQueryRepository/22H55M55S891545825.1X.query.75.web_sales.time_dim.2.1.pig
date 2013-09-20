web_sales = LOAD 'pigData/web_sales.dat' using PigStorage('|') AS (ws_sold_date_sk:int, ws_sold_time_sk:int, ws_ship_date_sk:int, ws_item_sk:int,ws_bill_customer_sk:int, ws_bill_cdemo_sk:int, ws_bill_hdemo_sk:int, ws_bill_addr_sk:int, ws_ship_customer_sk:int, ws_ship_cdemo_sk:int, ws_ship_hdemo_sk:int, ws_ship_addr_sk:int, ws_web_page_sk:int, ws_web_site_sk:int, ws_ship_mode_sk:int, ws_warehouse_sk:int, ws_promo_sk:int, ws_order_number:int, ws_quantity:int, ws_wholesale_cost:double, ws_list_price:double, ws_sales_price:double, ws_ext_discount_amt:double, ws_ext_sales_price:double, ws_ext_wholesale_cost:double, ws_ext_list_price:double, ws_ext_tax:double, ws_coupon_amt:double, ws_ext_ship_cost:double, ws_net_paid:double, ws_net_paid_inc_tax:double, ws_net_paid_inc_ship:double, ws_net_paid_inc_ship_tax:double, ws_net_profit:double);

time_dim = LOAD 'pigData/time_dim.dat' using PigStorage('|') AS (t_time_sk:int, t_time_id:chararray, t_time:int, t_hour:int, t_minute:int, t_second:int, t_am_pm:chararray, t_shift:chararray, t_sub_shift:chararray, t_meal_time:chararray);

proy_webSales = FOREACH web_sales GENERATE ws_sold_time_sk;
proy_timeDim = FOREACH time_dim GENERATE t_time_sk;

joinWebSalesTimeDim = JOIN proy_webSales BY ws_sold_time_sk, proy_timeDim BY t_time_sk;

STORE joinWebSalesTimeDim INTO 'queryResults/query.75.web_sales.time_dim.2.1' USING PigStorage('|');

rm queryResults/query.75.web_sales.time_dim.2.1;

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
