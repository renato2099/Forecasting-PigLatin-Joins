household_demographics = LOAD 'pigData/household_demographics.dat' using PigStorage('|') AS (hd_demo_sk:int, hd_income_band_sk:int, hd_buy_potential:chararray, hd_dep_count:int, hd_vehicle_count:int);

household_demographics2 = LOAD 'pigData/household_demographics.dat' using PigStorage('|') AS (hd_demo_sk:int, hd_income_band_sk:int, hd_buy_potential:chararray, hd_dep_count:int, hd_vehicle_count:int);

proy_hDemographics = FOREACH household_demographics GENERATE hd_demo_sk;
proy_hDemographics2 = FOREACH household_demographics2 GENERATE hd_demo_sk;

join_hDemographics_hDemographics2 = JOIN proy_hDemographics BY hd_demo_sk, proy_hDemographics2 BY hd_demo_sk USING 'merge';

STORE join_hDemographics_hDemographics2 INTO 'queryResults/query.33.household_demographics.household_demographics.1.1' using PigStorage('|');

rm queryResults/query.33.household_demographics.household_demographics.1.1;

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

