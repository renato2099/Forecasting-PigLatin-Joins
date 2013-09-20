store_dim = LOAD 'pigData/store.dat' using PigStorage('|') AS (s_store_sk:int, s_store_id:chararray, s_rec_start_date:chararray, s_rec_end_date:chararray, s_closed_date_sk:int, s_store_name:chararray, s_number_employees:int, s_floor_space:int, s_hours:chararray, S_manager:chararray, S_market_id:int, S_geography_class:chararray, S_market_desc:chararray, s_market_manager:chararray, s_division_id:int, s_division_name:chararray, s_company_id:int, s_company_name:chararray, s_street_number:chararray, s_street_name:chararray, s_street_type:chararray, s_suite_number:chararray, s_city:chararray, s_county:chararray, s_state:chararray, s_zip:chararray, s_country:chararray, s_gmt_offset:double, s_tax_percentage:double);

store_dim2 = LOAD 'pigData/store.dat' using PigStorage('|') AS (s_store_sk:int, s_store_id:chararray, s_rec_start_date:chararray, s_rec_end_date:chararray, s_closed_date_sk:int, s_store_name:chararray, s_number_employees:int, s_floor_space:int, s_hours:chararray, S_manager:chararray, S_market_id:int, S_geography_class:chararray, S_market_desc:chararray, s_market_manager:chararray, s_division_id:int, s_division_name:chararray, s_company_id:int, s_company_name:chararray, s_street_number:chararray, s_street_name:chararray, s_street_type:chararray, s_suite_number:chararray, s_city:chararray, s_county:chararray, s_state:chararray, s_zip:chararray, s_country:chararray, s_gmt_offset:double, s_tax_percentage:double);

proy_store = FOREACH store_dim GENERATE s_store_id;
proy_store2 = FOREACH store_dim2 GENERATE s_store_id;

join_store_store2 = JOIN proy_store BY s_store_id, proy_store2 BY s_store_id;

STORE join_store_store2 INTO 'queryResults/query.33.store.store.2.2' using PigStorage('|');

rm queryResults/query.33.store.store.2.2;

--select top 100 dt.d_year
 --       ,item.i_brand_id brand_id
 --       ,item.i_brand brand
--        ,sum(ss_ext_sales_price) ext_price
-- from date_dim dt
--     ,store_sales
--     ,item
-- where dt.d_date_sk = store_sales.ss_sold_date_sk
--    and store_sales.ss_item_sk = item.i_item_sk
--    and item.i_manager_id = 1
--    and dt.d_moy=12
--    and dt.d_year=1999
-- group by dt.d_year
--        ,item.i_brand
--        ,item.i_brand_id
-- order by dt.d_year
--        ,ext_price desc
--        ,brand_id
-- ;

