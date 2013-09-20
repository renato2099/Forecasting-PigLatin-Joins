customer_address2 = LOAD 'pigData/customer_address.dat' using PigStorage('|') AS (ca_address_sk:int, ca_address_id:chararray, ca_street_number:chararray, ca_street_name:chararray, ca_street_type:chararray, ca_suite_number:chararray, ca_city:chararray, ca_county:chararray, ca_state:chararray, ca_zip:chararray, ca_country:chararray, ca_gmt_offset:double, ca_location_type:chararray);

customer_address = LOAD 'pigData/customer_address.dat' using PigStorage('|') AS (ca_address_sk:int, ca_address_id:chararray, ca_street_number:chararray, ca_street_name:chararray, ca_street_type:chararray, ca_suite_number:chararray, ca_city:chararray, ca_county:chararray, ca_state:chararray, ca_zip:chararray, ca_country:chararray, ca_gmt_offset:double, ca_location_type:chararray);

proy_cAddress2 = FOREACH customer_address GENERATE ca_address_sk;
proy_cAddress = FOREACH customer_address GENERATE ca_address_sk;

join_cAddress_cAddress2 = JOIN proy_cAddress BY ca_address_sk, proy_cAddress2 BY ca_address_sk USING 'replicated';

STORE join_cAddress_cAddress2 INTO 'queryResults/query.31.customer_address.customer_address.1.1' using PigStorage('|');

rm queryResults/query.31.customer_address.customer_address.1.1;

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

