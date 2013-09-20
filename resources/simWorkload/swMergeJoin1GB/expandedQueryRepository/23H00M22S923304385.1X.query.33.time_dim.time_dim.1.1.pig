time_dim = LOAD 'pigData/time_dim.dat' using PigStorage('|') AS (t_time_sk:int, t_time_id:chararray, t_time:int, t_hour:int, t_minute:int, t_second:int, t_am_pm:chararray, t_shift:chararray, t_sub_shift:chararray, t_meal_time:chararray);

time_dim2 = LOAD 'pigData/time_dim.dat' using PigStorage('|') AS (t_time_sk:int, t_time_id:chararray, t_time:int, t_hour:int, t_minute:int, t_second:int, t_am_pm:chararray, t_shift:chararray, t_sub_shift:chararray, t_meal_time:chararray);

proy_timeDim = FOREACH time_dim GENERATE t_time_sk;
proy_timeDim2 = FOREACH time_dim2 GENERATE t_time_sk;

join_timeDim_timeDim2 = JOIN proy_timeDim2 BY t_time_sk, proy_timeDim BY t_time_sk USING 'merge';

STORE join_timeDim_timeDim2 INTO 'queryResults/query.33.time_dim.time_dim.1.1' using PigStorage('|');

rm queryResults/query.33.time_dim.time_dim.1.1;

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

