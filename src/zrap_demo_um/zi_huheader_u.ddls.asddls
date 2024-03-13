@EndUserText.label: 'Handeling Unit BO View'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZI_HUHeader_U
  as select from zgmhuhdr as huheader
  composition [0..*] of ZI_HUItem_U as _huitem
{
  key guid_hu               as GuidHu,
      tanum                 as Tanum,
      huident               as Huident,
      lgnum                 as Lgnum,
      letyp                 as Letyp,
      kunnr                 as Kunnr,
      scode                 as Scode,
      status                as Status,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt,

      _huitem
}
