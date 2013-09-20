customer_address = LOAD 'pigData/customer_address.dat' using PigStorage('|') AS (ca_address_sk:int, ca_address_id:chararray, ca_street_number:chararray, ca_street_name:chararray, ca_street_type:chararray, ca_suite_number:chararray, ca_city:chararray, ca_county:chararray, ca_state:chararray, ca_zip:chararray, ca_country:chararray, ca_gmt_offset:double, ca_location_type:chararray);

warehouse = LOAD 'pigData/warehouse.dat' using PigStorage('|') AS (w_warehouse_sk:int, w_warehouse_id:chararray, w_warehouse_name:chararray, w_warehouse_sq_ft:int, w_street_number:chararray, w_street_name:chararray, w_street_type:chararray, w_suite_number:chararray, w_city:chararray, w_county:chararray, w_state:chararray, w_zip:chararray, w_country:chararray, w_gmt_offset:double);   

proy_customerAddress = FOREACH customer_address GENERATE ca_gmt_offset;
proy_warehouse = FOREACH warehouse GENERATE w_gmt_offset;

join_customerAddress_warehouse = JOIN proy_customerAddress BY ca_gmt_offset, proy_warehouse BY w_gmt_offset;

STORE join_customerAddress_warehouse INTO 'queryResults/query.5.customer_address.warehouse.12.14' using PigStorage('|');

rm queryResults/query.5.customer_address.warehouse.12.14;

-- start query 65 in stream 0 using template query20.tpl
--select top 100 i_item_desc
--       ,i_category
--       ,i_class
--       ,i_current_price
--       ,sum(cs_ext_sales_price) as itemrevenue
--       ,sum(cs_ext_sales_price)*100/sum(sum(cs_ext_sales_price)) over
--           (partition by i_class) as revenueratio
-- from   catalog_sales
--     ,item
--     ,date_dim
-- where cs_item_sk = i_item_sk
--   and i_category in ('Shoes', 'Electronics', 'Home')
--   and cs_sold_date_sk = d_date_sk
-- and d_date between cast('2001-06-21' as date)
--                               and (cast('2001-06-21' as date) + 30 days)
-- group by i_item_id
--         ,i_item_desc
--         ,i_category
--         ,i_class
--         ,i_current_price
-- order by i_category
--         ,i_class
--         ,i_item_id
--         ,i_item_desc
--         ,revenueratio
--;
-- end query 65 in stream 0 using template query20.tpl

