@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_WORK_ORDER'
define root view entity ZC_WORK_ORDER
  provider contract transactional_query
  as projection on ZR_WORK_ORDER
{
  key GuID,
  OrigLand,
  OrigWerks,
  WorkOrder,
  WoItemNo,
  Matnr,
  MatGtin,
  MatRevlv,
  MatUnit,
  MatCharg,
  MatSernr,
  MatSernp,
  MatVfdat,
  MatHsdat,
  MatCoo,
  MatPom,
  MatMaktx,
  Activity,
  ActQpa,
  ActUnit,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LocalLastChangedAt
  
}
