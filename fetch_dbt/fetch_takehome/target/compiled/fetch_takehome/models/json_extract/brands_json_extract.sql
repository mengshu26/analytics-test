select
json_extract_path_text (to_json(json_txt), '_id', '$oid')::varchar as brandId,
json_extract_path_text (to_json(json_txt), 'barcode')::varchar as barcode,
json_extract_path_text (to_json(json_txt), 'category')::varchar as category,
json_extract_path_text (to_json(json_txt), 'categoryCode')::varchar as categoryCode,
json_extract_path_text (to_json(json_txt), 'cpg', '$id', '$oid')::varchar as cpgId,
json_extract_path_text (to_json(json_txt), 'cpg', '$ref')::varchar as cpgRef,
json_extract_path_text (to_json(json_txt), 'name')::varchar as brandName,
json_extract_path_text (to_json(json_txt), 'brandCode')::varchar as brandCode,
json_extract_path_text (to_json(json_txt), 'topBrand')::varchar as topBrand
from fetch_takehome.brands