@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Handeling Unit Item BO View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_HUItem
  as select from zgmhuitm as Item
  association to parent ZI_HUHeader as _Header on $projection.GuidHu = _Header.GuidHu
{
  key guid_stock            as GuidStock,
      guid_hu               as GuidHu,
      matnr                 as Matnr,
      charg                 as Charg,
      @Semantics.quantity.unitOfMeasure: 'Meins'
      quan                  as Quan,
      meins                 as Meins,
      currency_code         as CurrencyCode,
      docid                 as Docid,
      docitmid              as Docitmid,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      /* associations */
      _Header
}
