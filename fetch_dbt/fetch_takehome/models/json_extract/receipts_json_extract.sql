select
json_extract_path_text (to_json(json_txt), '_id', '$oid')::varchar as receiptId,
json_extract_path_text (to_json(json_txt), 'bonusPointsEarned')::varchar as bonusPointsEarned,
json_extract_path_text (to_json(json_txt), 'bonusPointsEarnedReason')::varchar as bonusPointsEarnedReason,
json_extract_path_text (to_json(json_txt), 'createDate', '$date')::varchar as createDate,
json_extract_path_text (to_json(json_txt), 'dateScanned', '$date')::varchar as dateScanned,
json_extract_path_text (to_json(json_txt), 'finishedDate', '$date')::varchar as finishedDate,
json_extract_path_text (to_json(json_txt), 'modifyDate', '$date')::varchar as modifyDate,
json_extract_path_text (to_json(json_txt), 'pointsAwardedDate', '$date')::varchar as pointsAwardedDate,
json_extract_path_text (to_json(json_txt), 'pointsEarned')::varchar as pointsEarned,
json_extract_path_text (to_json(json_txt), 'purchaseDate', '$date')::varchar as purchaseDate,
json_extract_path_text (to_json(json_txt), 'purchasedItemCount')::varchar as purchasedItemCount,
json_extract_path_text (to_json(json_txt), 'rewardsReceiptItemList')::varchar as rewardsReceiptItemList,
json_extract_path_text (to_json(json_txt), 'rewardsReceiptStatus')::varchar as rewardsReceiptStatus,
json_extract_path_text (to_json(json_txt), 'totalSpent')::varchar as totalSpent,
json_extract_path_text (to_json(json_txt), 'userId')::varchar as userId
from fetch_takehome.receipts
