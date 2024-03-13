@EndUserText.label: 'Handeling Unit Item BO Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Search.searchable: true
@Metadata.allowExtensions: true

define view entity ZC_HUItem
  as projection on ZI_HUItem
{
  key GuidStock,
      GuidHu,
      @Search.defaultSearchElement: true
      Matnr,
      Charg,
      Quan,
      Meins,
      CurrencyCode,
      Docid,
      Docitmid,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,

      /* Associations */
      _Header : redirected to parent ZC_HUHeader
}
