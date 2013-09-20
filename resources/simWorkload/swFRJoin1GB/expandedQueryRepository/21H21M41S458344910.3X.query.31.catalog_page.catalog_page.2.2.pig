catalog_page = LOAD 'pigData/catalog_page.dat' using PigStorage('|') AS (cp_catalog_page_sk:int, cp_catalog_page_id:chararray, cp_start_date_sk:int, cp_end_date_sk:int, cp_department:chararray, cp_catalog_number:int, cp_catalog_page_number:int, cp_description:chararray, cp_type:chararray);

catalog_page2 = LOAD 'pigData/catalog_page.dat' using PigStorage('|') AS (cp_catalog_page_sk:int, cp_catalog_page_id:chararray, cp_start_date_sk:int, cp_end_date_sk:int, cp_department:chararray, cp_catalog_number:int, cp_catalog_page_number:int, cp_description:chararray, cp_type:chararray);

proy_catalogPage = FOREACH catalog_page GENERATE cp_catalog_page_id;
proy_catalogPage2 = FOREACH catalog_page2 GENERATE cp_catalog_page_id;

join_catalogPage_catalogPage2 = JOIN proy_catalogPage BY cp_catalog_page_id, proy_catalogPage2 BY cp_catalog_page_id USING 'replicated';

STORE join_catalogPage_catalogPage2 INTO 'queryResults/query.31.catalog_page.catalog_page.2.2' using PigStorage('|');

rm queryResults/query.31.catalog_page.catalog_page.2.2;

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

