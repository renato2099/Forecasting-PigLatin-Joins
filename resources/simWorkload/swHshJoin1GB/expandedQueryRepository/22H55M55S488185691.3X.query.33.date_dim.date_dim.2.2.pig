date_dim = LOAD 'pigData/date_dim.dat' using PigStorage('|') AS (d_date_sk:int, d_date_id:chararray, d_date:chararray, d_month_seq:int, d_week_seq:int, d_quarter_seq:int, d_year:int, d_dow:int, d_moy:int, d_dom:int, d_qoy:int, d_fy_year:int,d_fy_quarter_seq:int, d_fy_week_seq:int, d_day_name:chararray, d_quarter_name:chararray, d_holiday:chararray, d_weekend:chararray, d_following_holiday:chararray, d_first_dom:int, d_last_dom:int, d_same_day_ly:int, d_same_day_lq:int, d_current_day:chararray, d_current_week:chararray, d_current_month:chararray, d_current_quarter:chararray, d_current_year:chararray);

date_dim2 = LOAD 'pigData/date_dim.dat' using PigStorage('|') AS (d_date_sk:int, d_date_id:chararray, d_date:chararray, d_month_seq:int, d_week_seq:int, d_quarter_seq:int, d_year:int, d_dow:int, d_moy:int, d_dom:int, d_qoy:int, d_fy_year:int,d_fy_quarter_seq:int, d_fy_week_seq:int, d_day_name:chararray, d_quarter_name:chararray, d_holiday:chararray, d_weekend:chararray, d_following_holiday:chararray, d_first_dom:int, d_last_dom:int, d_same_day_ly:int, d_same_day_lq:int, d_current_day:chararray, d_current_week:chararray, d_current_month:chararray, d_current_quarter:chararray, d_current_year:chararray);

proy_dateDim = FOREACH date_dim GENERATE d_date_id;
proy_dateDim2 = FOREACH date_dim2 GENERATE d_date_id;

join_dateDim_dateDim2 = JOIN proy_dateDim BY d_date_id, proy_dateDim2 BY d_date_id;

STORE join_dateDim_dateDim2 INTO 'queryResults/query.33.date_dim.date_dim.2.2' using PigStorage('|');

rm queryResults/query.33.date_dim.date_dim.2.2;

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

