select
brandId as brandId,
barcode as barcode,
category as category,
categoryCode as categoryCode,
cpgId as cpgId,
cpgRef as cpgRef,
brandName as brandName,
brandCode as brandCode,
topBrand::boolean as topBrand
from fetch_takehome.brands_json_extract
