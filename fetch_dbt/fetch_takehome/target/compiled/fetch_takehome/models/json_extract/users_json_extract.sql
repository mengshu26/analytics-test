select
json_extract_path_text (to_json(json_txt), '_id', '$oid')::varchar as userId,
json_extract_path_text (to_json(json_txt), 'role')::varchar as role,
json_extract_path_text (to_json(json_txt), 'state')::varchar as state,
json_extract_path_text (to_json(json_txt), 'active')::varchar as active,
json_extract_path_text (to_json(json_txt), 'lastLogin', '$date')::varchar as lastLogin,
json_extract_path_text (to_json(json_txt), 'createdDate', '$date')::varchar as createdDate,
json_extract_path_text (to_json(json_txt), 'signUpSource')::varchar as signUpSource
from fetch_takehome.users