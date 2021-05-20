select
userId as userId,
role as role,
state as state,
active::boolean as active,
to_timestamp(lastLogin::numeric/1000) as lastLogin,
to_timestamp(createdDate::numeric/1000) as createdDate,
signUpSource as signUpSource
from fetch_takehome.users_json_extract