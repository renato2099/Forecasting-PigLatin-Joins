store_returns = LOAD 'pigData/store_returns.dat' using PigStorage('|') AS (sr_returned_date_sk:int, sr_return_time_sk:int, sr_item_sk:int, sr_customer_sk:int, sr_cdemo_sk:int, sr_hdemo_sk:int, sr_addr_sk:int, sr_store_sk:int, sr_reason_sk:int, sr_ticket_number:int, sr_return_quantity:int, sr_return_amt:double, sr_return_tax:double, sr_return_amt_inc_tax:double, sr_fee:double, sr_return_ship_cost:double, sr_refunded_cash:double, sr_reversed_charge:double, sr_store_credit:double, sr_net_loss:double);

date_dim = LOAD 'pigData/date_dim.dat' using PigStorage('|') AS (d_date_sk:int, d_date_id:chararray, d_date:chararray, d_month_seq:int, d_week_seq:int, d_quarter_seq:int, d_year:int, d_dow:int, d_moy:int, d_dom:int, d_qoy:int, d_fy_year:int,d_fy_quarter_seq:int, d_fy_week_seq:int, d_day_name:chararray, d_quarter_name:chararray, d_holiday:chararray, d_weekend:chararray, d_following_holiday:chararray, d_first_dom:int, d_last_dom:int, d_same_day_ly:int, d_same_day_lq:int, d_current_day:chararray, d_current_week:chararray, d_current_month:chararray, d_current_quarter:chararray, d_current_year:chararray);

proy_storeReturns = FOREACH store_returns GENERATE sr_returned_date_sk;
proy_dateDim = FOREACH date_dim GENERATE d_date_sk;

join_storeReturns_dateDim = JOIN proy_storeReturns BY sr_returned_date_sk, proy_dateDim BY d_date_sk USING 'replicated';

STORE join_storeReturns_dateDim INTO 'queryResults/query.11.store_returns.date_dim.1.1' using PigStorage('|');

rm queryResults/query.11.store_returns.date_dim.1.1;

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

