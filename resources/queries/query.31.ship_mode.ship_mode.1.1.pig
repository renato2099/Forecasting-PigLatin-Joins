ship_mode = LOAD 'pigData/ship_mode.dat' using PigStorage('|') AS (sm_ship_mode_sk:int, sm_ship_mode_id:chararray, sm_type:chararray, sm_code:chararray, sm_carrier:chararray, sm_contract:chararray);

ship_mode2 = LOAD 'pigData/ship_mode.dat' using PigStorage('|') AS (sm_ship_mode_sk:int, sm_ship_mode_id:chararray, sm_type:chararray, sm_code:chararray, sm_carrier:chararray, sm_contract:chararray);

proy_shipMode = FOREACH ship_mode GENERATE sm_ship_mode_sk;
proy_shipMode2 = FOREACH ship_mode2 GENERATE sm_ship_mode_sk;

joinShipModeShipMode2 = JOIN proy_shipMode BY sm_ship_mode_sk, proy_shipMode2 BY sm_ship_mode_sk;

STORE joinShipModeShipMode2 INTO 'queryResults/query.31.ship_mode.ship_mode.1.1' USING PigStorage('|');

rm queryResults/query.31.ship_mode.ship_mode.1.1;

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
