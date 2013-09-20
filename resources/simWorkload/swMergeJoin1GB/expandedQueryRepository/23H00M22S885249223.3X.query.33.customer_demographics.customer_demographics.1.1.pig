customer_demographics = LOAD 'pigData/customer_demographics.dat' using PigStorage('|') AS (cd_demo_sk:int, cd_gender:chararray, cd_marital_status:chararray, cd_education_status:chararray, cd_purchase_estimate:int, cd_credit_rating:chararray, cd_dep_count:int, cd_dep_employed_count:int, cd_dep_college_count:int);

customer_demographics2 = LOAD 'pigData/customer_demographics.dat' using PigStorage('|') AS (cd_demo_sk:int, cd_gender:chararray, cd_marital_status:chararray, cd_education_status:chararray, cd_purchase_estimate:int, cd_credit_rating:chararray, cd_dep_count:int, cd_dep_employed_count:int, cd_dep_college_count:int);

proy_cDemo = FOREACH customer_demographics GENERATE cd_demo_sk;
proy_cDemo2 = FOREACH customer_demographics2 GENERATE cd_demo_sk;

join_cDemo_cDemo2 = JOIN proy_cDemo BY cd_demo_sk, proy_cDemo2 BY cd_demo_sk USING 'merge';

STORE join_cDemo_cDemo2 INTO 'queryResults/query.33.customer_demographics.customer_demographics.1.1' using PigStorage('|');

rm queryResults/query.33.customer_demographics.customer_demographics.1.1;

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

