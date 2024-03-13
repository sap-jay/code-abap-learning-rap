INTERFACE zif_types_for_system_info
  PUBLIC .
  TYPES:
  rfcproto TYPE c LENGTH 000003 .
  TYPES:
    rfcchartyp TYPE c LENGTH 000004   .
  TYPES:
    rfcinttyp TYPE c LENGTH 000003   .
  TYPES:
    rfcflotyp TYPE c LENGTH 000003   .
  TYPES:
    rfcdest TYPE c LENGTH 000032   .
  TYPES:
    rfcchar8 TYPE c LENGTH 000008  .
  TYPES:
    sysysid TYPE c LENGTH 000008  .
  TYPES:
    rfcdbhost TYPE c LENGTH 000032  .
  TYPES:
    sydbsys TYPE c LENGTH 000010  .
  TYPES:
    sysaprl TYPE c LENGTH 000004  .
  TYPES:
    rfcmach TYPE c LENGTH 000005  .
  TYPES:
    syopsys TYPE c LENGTH 000010  .
  TYPES:
    rfctzone TYPE c LENGTH 000006  .
  TYPES:
    sydayst TYPE c LENGTH 000001  .
  TYPES:
    rfcipaddr TYPE c LENGTH 000015  .
  TYPES:
    sykernrl TYPE c LENGTH 000004  .
  TYPES:
    syhost TYPE c LENGTH 000032  .
  TYPES:
    rfcsi_resv TYPE c LENGTH 000012  .
  TYPES:
    rfcipv6addr TYPE c LENGTH 000045  .
  TYPES:
    BEGIN OF rfcsi                         ,
      rfcproto    TYPE rfcproto,
      rfcchartyp  TYPE rfcchartyp,
      rfcinttyp   TYPE rfcinttyp,
      rfcflotyp   TYPE rfcflotyp,
      rfcdest     TYPE rfcdest,
      rfchost     TYPE rfcchar8,
      rfcsysid    TYPE sysysid,
      rfcdatabs   TYPE sysysid,
      rfcdbhost   TYPE rfcdbhost,
      rfcdbsys    TYPE sydbsys,
      rfcsaprl    TYPE sysaprl,
      rfcmach     TYPE rfcmach,
      rfcopsys    TYPE syopsys,
      rfctzone    TYPE rfctzone,
      rfcdayst    TYPE sydayst,
      rfcipaddr   TYPE rfcipaddr,
      rfckernrl   TYPE sykernrl,
      rfchost2    TYPE syhost,
      rfcsi_resv  TYPE rfcsi_resv,
      rfcipv6addr TYPE rfcipv6addr,
    END OF rfcsi                           .



ENDINTERFACE.
