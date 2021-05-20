

  create  table "postgres"."fetch_takehome"."fact_items__dbt_tmp"
  as (
    select
receiptId as receiptId,
userId as userId,
barcode as barcode,
--to_timestamp(createDate::numeric/1000)::date as createDate,
to_timestamp(dateScanned::numeric / 1000)::date as dateScanned,
to_timestamp(finishedDate::numeric / 1000)::date as finishedDate,
to_timestamp(modifyDate::numeric / 1000)::date as modifyDate,
to_timestamp(purchaseDate::numeric/1000) as purchaseDate,
finalPrice::numeric as finalPrice,
itemPrice::numeric as itemPrice,
partnerItemId as partnerItemId,
pointsEarned::numeric as pointsEarned,
pointsPayerId as pointsPayerId,
quantityPurchased::numeric as quantityPurchased,
rewardsGroup as rewardsGroup,
rewardsProductPartnerId as rewardsProductPartnerId,
targetPrice::numeric as targetPrice,
competitiveProduct::boolean as competitiveProduct,
needsFetchReview as needsFetchReview,
originalFinalPrice::numeric as originalFinalPrice,
originalMetaBriteBarcode as originalMetaBriteBarcode,
originalMetaBriteDescription as originalMetaBriteDescription,
originalMetaBriteItemPrice::numeric as originalMetaBriteItemPrice,
originalMetaBriteQuantityPurchased::numeric as originalMetaBriteQuantityPurchased,
preventTargetGapPoints as preventTargetGapPoints,
userFlaggedBarcode as userFlaggedBarcode,
userFlaggedNewItem as userFlaggedNewItem,
userFlaggedPrice::numeric as userFlaggedPrice,
userFlaggedQuantity::integer as userFlaggedQuantity,
itemNumber as itemNumber,
priceAfterCoupon::numeric as priceAfterCoupon,
needsFetchReviewReason as needsFetchReviewReason,
metabriteCampaignId as metabriteCampaignId,
discountedItemPrice::numeric as discountedItemPrice,
competitorRewardsGroup as competitorRewardsGroup,
originalReceiptItemText as originalReceiptItemText,
pointsNotAwardedReason as pointsNotAwardedReason
from fetch_takehome.items_json_extract
  );