reason = LOAD 'pigData/reason.dat' using PigStorage('|') AS (r_reason_sk:int, r_reason_id:chararray, r_reason_desc:chararray);
reason2 = LOAD 'pigData/reason.dat' using PigStorage('|') AS (r_reason_sk:int, r_reason_id:chararray, r_reason_desc:chararray);

proy_reason = FOREACH reason GENERATE r_reason_id;
proy_reason2 = FOREACH reason2 GENERATE r_reason_id;

join_reason_reason2 = JOIN proy_reason BY r_reason_id, proy_reason2 BY r_reason_id;

STORE join_reason_reason2 INTO 'queryResults/query.33.reason.reason.2.2' using PigStorage('|');

rm queryResults/query.33.reason.reason.2.2;

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

