@EndUserText.label: 'Handeling Unit Item BO Projection View'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_HUItem_U
  as select from zgmhuitm as huitem
  association to parent ZI_HUHeader_U as _huheader on $projection.GuidHu = _huheader.GuidHu
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
      created_by            as CreatedBy,
      last_changed_by       as LastChangedBy,
      local_last_changed_at as LocalLastChangedAt,

      _huheader
}
