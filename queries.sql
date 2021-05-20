--What are the top 5 brands by receipts scanned for most recent month?
select b.brandname, count(a.barcode) as quantity_scanned
from fetch_takehome.fact_items as a
left join fetch_takehome.dim_brands as b
on a.barcode = b.barcode
where datescanned >= '2021-02-01' and datescanned < '2021-03-01' and b.brandname is not null --the data only goes til march 2021, so month of feb is the most recent month
group by 1
order by quantity_scanned desc
limit 5;


--When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?
select rewardsReceiptStatus, avg(totalspent) as avg_spend
from fetch_takehome.fact_receipts
where rewardsReceiptStatus = 'ACCEPTED' or rewardsReceiptStatus = 'REJECTED'
group by 1
order by avg_spend desc ;


--When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

select rewardsReceiptStatus, sum(PurchasedItemCount) as total_items_purchased
from fetch_takehome.fact_receipts
where rewardsReceiptStatus = 'ACCEPTED' or rewardsReceiptStatus = 'REJECTED'
group by 1
order by total_items_purchased desc ;



--Which brand has the most spend among users who were created within the past 6 months?


select
b.brandname,
sum(finalprice::numeric) as total_spend
from fetch_takehome.fact_items as a
left join fetch_takehome.dim_brands as b
on a.barcode = b.barcode
left join fetch_takehome.fact_users as c
on a.userid = c.userid
where
c.createdDate < '2020-09-01'
and
b.brandname is not null
group by 1
order by total_spend desc;


--Which brand has the most transactions among users who were created within the past 6 months?

select
b.brandname,
count(a.barcode) as transactions
from fetch_takehome.fact_items as a
left join fetch_takehome.dim_brands as b
on a.barcode = b.barcode
left join fetch_takehome.fact_users as c
on a.userid = c.userid
where
c.createdDate < '2020-09-01'
and
b.brandname is not null
group by 1
order by transactions desc;
