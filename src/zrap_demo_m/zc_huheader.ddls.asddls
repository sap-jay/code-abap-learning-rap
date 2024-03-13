@EndUserText.label: 'Handeling Unit BO Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_HUHeader
  as projection on ZI_HUHeader
{
  key GuidHu,
      Tanum,
      @Search.defaultSearchElement: true
      Huident,
      Lgnum,
      Letyp,
      Kunnr,
      Scode,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Item : redirected to composition child ZC_HUItem
}
