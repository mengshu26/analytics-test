-- checking that barcodes are unique
SELECT
    barcode,
    count(barcode)
FROM fetch_takehome.dim_brands
GROUP BY 1
HAVING count(barcode) > 1;
-- there are 7 barcodes that have 2 unique items associated with them, this creates for prblems in joining the tables unless another join column exists (I couldn't find another)


-- checking for a list of categories within receipts status
select distinct (rewardsReceiptStatus)
from fetch_takehome.fact_receipts;
--accepted is not in this category


-- checkign for number of nulls in each column in the items table
select key as column, count(*) as null_values
from fetch_takehome.fact_items t
cross join jsonb_each_text(to_jsonb(t))
where value is null
group by key
order by null_values desc;
--- 80% of the columns in the items table have 90%+ null values, can some of these columns be combined? are they necessary in analysis?
