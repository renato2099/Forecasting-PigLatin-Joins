inventory = LOAD 'pigData/inventory.dat' using PigStorage('|') AS (inv_date_sk:int, inv_item_sk:int, inv_warehouse_sk:int, inv_quantity_on_hand:int);

item = LOAD 'pigData/item.dat' using PigStorage('|') AS (i_item_sk:int, i_item_id:chararray, i_rec_start_date:chararray, i_rec_end_date:chararray, i_item_desc:chararray, i_current_price:double, i_wholesale_cost:double, i_brand_id:int, i_brand:chararray, i_class_id:int, i_class:chararray, i_category_id:int, i_category:chararray, i_manufact_id:int, i_manufact:chararray, i_size:chararray, i_formulation:chararray, i_color:chararray, i_units:chararray, i_container:chararray, i_manager_id:int, i_product_name:chararray);

proy_inventory = FOREACH inventory GENERATE inv_item_sk;
proy_item = FOREACH item GENERATE i_item_sk;

--it_group = GROUP it_proy BY i_item_sk;

join_inventory_item = JOIN proy_inventory BY inv_item_sk, proy_item BY i_item_sk;

STORE join_inventory_item INTO 'queryResults/query.5.inventory.item.2.1' using PigStorage('|');

rm queryResults/query.5.inventory.item.2.1;

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

