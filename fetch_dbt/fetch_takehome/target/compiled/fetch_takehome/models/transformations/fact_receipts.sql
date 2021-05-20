select
receiptId as receiptId,
bonusPointsEarned::numeric as bonusPointsEarned,
bonusPointsEarnedReason as bonusPointsEarnedReason,
to_timestamp(createDate::numeric/1000)::date as createDate,
to_timestamp(dateScanned::numeric / 1000)::date as dateScanned,
to_timestamp(finishedDate::numeric / 1000)::date as finishedDate,
to_timestamp(modifyDate::numeric / 1000)::date as modifyDate,
to_timestamp(pointsAwardedDate::numeric/1000) as pointsAwardedDate,
pointsEarned::numeric as pointsEarned,
to_timestamp(purchaseDate::numeric/1000) as purchaseDate,
purchasedItemCount::numeric as purchasedItemCount,
rewardsReceiptStatus as rewardsReceiptStatus,
totalSpent::numeric as totalSpent,
userId as userId
from fetch_takehome.receipts_json_extract