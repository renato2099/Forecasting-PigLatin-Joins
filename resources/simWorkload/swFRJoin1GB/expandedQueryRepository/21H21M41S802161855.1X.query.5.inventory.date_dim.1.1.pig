inventory = LOAD 'pigData/inventory.dat' using PigStorage('|') AS (inv_date_sk:int, inv_item_sk:int, inv_warehouse_sk:int, inv_quantity_on_hand:int);

date_dim = LOAD 'pigData/date_dim.dat' using PigStorage('|') AS (d_date_sk:int, d_date_id:chararray, d_date:chararray, d_month_seq:int, d_week_seq:int, d_quarter_seq:int, d_year:int, d_dow:int, d_moy:int, d_dom:int, d_qoy:int, d_fy_year:int, d_fy_quarter_seq:int, d_fy_week_seq:int, d_day_name:chararray, d_quarter_name:chararray, d_holiday:chararray, d_weekend:chararray, d_following_holiday:chararray, d_first_dom:int, d_last_dom:int, d_same_day_ly:int, d_same_day_lq:int, d_current_day:chararray, d_current_week:chararray, d_current_month:chararray, d_current_quarter:chararray, d_current_year:chararray);

proy_inventory = FOREACH inventory GENERATE inv_date_sk;
proy_dateDim = FOREACH date_dim GENERATE d_date_sk;

join_inventory_dateDim = JOIN proy_inventory BY inv_date_sk, proy_dateDim BY d_date_sk USING 'replicated';

STORE join_inventory_dateDim INTO 'queryResults/query.5.inventory.date_dim.1.1' using PigStorage('|');

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

