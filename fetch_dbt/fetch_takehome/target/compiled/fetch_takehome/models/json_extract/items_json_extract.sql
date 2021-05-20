with a as (

    select
    receiptId,
    userId,
    createDate,
    dateScanned,
    finishedDate,
    modifyDate,
    purchaseDate,
    json_array_elements_text (rewardsreceiptitemlist::json) as items
    from fetch_takehome.receipts_json_extract
)

select
receiptId,
userId,
createDate,
dateScanned,
finishedDate,
modifyDate,
purchaseDate,
json_extract_path_text (to_json(items::json), 'barcode')::varchar as barcode,
json_extract_path_text (to_json(items::json), 'description')::varchar as description,
json_extract_path_text (to_json(items::json), 'finalPrice')::varchar as finalPrice,
json_extract_path_text (to_json(items::json), 'itemPrice')::varchar as itemPrice,
json_extract_path_text (to_json(items::json), 'partnerItemId')::varchar as partnerItemId,
json_extract_path_text (to_json(items::json), 'pointsEarned')::varchar as pointsEarned,
json_extract_path_text (to_json(items::json), 'pointsPayerId')::varchar as pointsPayerId,
json_extract_path_text (to_json(items::json), 'quantityPurchased')::varchar as quantityPurchased,
json_extract_path_text (to_json(items::json), 'rewardsGroup')::varchar as rewardsGroup,
json_extract_path_text (to_json(items::json), 'rewardsProductPartnerId')::varchar as rewardsProductPartnerId,
json_extract_path_text (to_json(items::json), 'targetPrice')::varchar as targetPrice,
json_extract_path_text (to_json(items::json), 'competitiveProduct')::varchar as competitiveProduct,
json_extract_path_text (to_json(items::json), 'needsFetchReview')::varchar as needsFetchReview,
json_extract_path_text (to_json(items::json), 'originalFinalPrice')::varchar as originalFinalPrice,
json_extract_path_text (to_json(items::json), 'originalMetaBriteBarcode')::varchar as originalMetaBriteBarcode,
json_extract_path_text (to_json(items::json), 'originalMetaBriteDescription')::varchar as originalMetaBriteDescription,
json_extract_path_text (to_json(items::json), 'originalMetaBriteItemPrice')::varchar as originalMetaBriteItemPrice,
json_extract_path_text (to_json(items::json), 'originalMetaBriteQuantityPurchased')::varchar as originalMetaBriteQuantityPurchased,
json_extract_path_text (to_json(items::json), 'preventTargetGapPoints')::varchar as preventTargetGapPoints,
json_extract_path_text (to_json(items::json), 'userFlaggedBarcode')::varchar as userFlaggedBarcode,
json_extract_path_text (to_json(items::json), 'userFlaggedNewItem')::varchar as userFlaggedNewItem,
json_extract_path_text (to_json(items::json), 'userFlaggedPrice')::varchar as userFlaggedPrice,
json_extract_path_text (to_json(items::json), 'userFlaggedQuantity')::varchar as userFlaggedQuantity,
json_extract_path_text (to_json(items::json), 'itemNumber')::varchar as itemNumber,
json_extract_path_text (to_json(items::json), 'priceAfterCoupon')::varchar as priceAfterCoupon,
json_extract_path_text (to_json(items::json), 'needsFetchReviewReason')::varchar as needsFetchReviewReason,
json_extract_path_text (to_json(items::json), 'metabriteCampaignId')::varchar as metabriteCampaignId,
json_extract_path_text (to_json(items::json), 'discountedItemPrice')::varchar as discountedItemPrice,
json_extract_path_text (to_json(items::json), 'competitorRewardsGroup')::varchar as competitorRewardsGroup,
json_extract_path_text (to_json(items::json), 'originalReceiptItemText')::varchar as originalReceiptItemText,
json_extract_path_text (to_json(items::json), 'pointsNotAwardedReason')::varchar as pointsNotAwardedReason
from a