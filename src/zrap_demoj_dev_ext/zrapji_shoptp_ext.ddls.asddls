@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forShop'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ 'Shop' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define root view entity ZRAPJI_ShopTP_EXT
  provider contract transactional_interface
  as projection on ZRAPJR_ShopTP_EXT as Shop
{
  key OrderUUID,
  OrderID,
  OrderedItem,
  CurrencyCode,
  OrderItemPrice,
  DeliveryDate,
  OverallStatus,
  Notes,
  LastChangedAt,
  CreatedBy,
  CreatedAt,
  LocalLastChangedBy,
  LastChangedBy,
  LocalLastChangedAt
  
}
