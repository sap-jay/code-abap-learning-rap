@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED ZWORK_ORDER'
define root view entity ZR_WORK_ORDER
  as select from zwork_order as workorder
{
  key guid as GuID,
  orig_land as OrigLand,
  orig_werks as OrigWerks,
  work_order as WorkOrder,
  wo_item_no as WoItemNo,
  matnr as Matnr,
  mat_gtin as MatGtin,
  mat_revlv as MatRevlv,
  mat_unit as MatUnit,
  mat_charg as MatCharg,
  mat_sernr as MatSernr,
  mat_sernp as MatSernp,
  mat_vfdat as MatVfdat,
  mat_hsdat as MatHsdat,
  mat_coo as MatCoo,
  mat_pom as MatPom,
  mat_maktx as MatMaktx,
  activity as Activity,
  act_qpa as ActQpa,
  act_unit as ActUnit,
  created_by as CreatedBy,
  created_at as CreatedAt,
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
  
}
