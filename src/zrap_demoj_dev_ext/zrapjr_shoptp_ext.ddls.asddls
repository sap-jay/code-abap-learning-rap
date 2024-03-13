@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forShop'
@AbapCatalog.extensibility: {
  extensible: true,
  elementSuffix: 'ZAA',
  allowNewDatasources: false,
  allowNewCompositions: true,
  dataSources: [ '_Extension' ],
  quota: {
    maximumFields: 100 ,
    maximumBytes: 10000
  }
}
define root view entity ZRAPJR_ShopTP_EXT
  as select from zrap_demoj_dev_a as Shop
  association [1] to ZRAPJE_Shop_EXT as _Extension on $projection.OrderUUID = _Extension.OrderUUID
{
  key order_uuid            as OrderUUID,
      order_id              as OrderID,
      ordered_item          as OrderedItem,
      currency_code         as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      order_item_price      as OrderItemPrice,
      delivery_date         as DeliveryDate,
      overall_status        as OverallStatus,
      notes                 as Notes,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      _Extension

}
