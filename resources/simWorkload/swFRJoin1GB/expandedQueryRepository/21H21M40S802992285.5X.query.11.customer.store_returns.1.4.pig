store_returns = LOAD 'pigData/store_returns.dat' using PigStorage('|') AS (sr_returned_date_sk:int, sr_return_time_sk:int, sr_item_sk:int, sr_customer_sk:int, sr_cdemo_sk:int, sr_hdemo_sk:int, sr_addr_sk:int, sr_store_sk:int, sr_reason_sk:int, sr_ticket_number:int, sr_return_quantity:int, sr_return_amt:double, sr_return_tax:double, sr_return_amt_inc_tax:double, sr_fee:double, sr_return_ship_cost:double, sr_refunded_cash:double, sr_reversed_charge:double, sr_store_credit:double, sr_net_loss:double);

customer = LOAD 'pigData/customer.dat' using PigStorage('|') AS (c_customer_sk:int, c_customer_id:chararray, c_current_cdemo_sk:int, c_current_hdemo_sk:int, c_current_addr_sk:int, c_first_shipto_date_sk:int, c_first_sales_date_sk:int, c_salutation:chararray, c_first_name:chararray, c_last_name:chararray, c_preferred_cust_flag:chararray, c_birth_day:int, c_birth_month:int, c_birth_year:int, c_birth_country:chararray, c_login:chararray, c_email_address:chararray, c_last_review_date_sk:int);

proy_storeReturns = FOREACH store_returns GENERATE sr_customer_sk;
proy_customer = FOREACH customer GENERATE c_customer_sk;

join_customer_storeReturns = JOIN proy_customer BY c_customer_sk, proy_storeReturns BY sr_customer_sk USING 'replicated';

STORE join_customer_storeReturns INTO 'queryResults/query.11.customer.store_returns.1.4' using PigStorage('|');

rm queryResults/query.11.customer.store_returns.1.4;

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

