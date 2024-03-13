CLASS zcl_system_info_rfc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_system_info_rfc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.

*    DATA(lo_destination) = cl_rfc_destination_provider=>create_by_comm_arrangement(
*      comm_scenario          = 'Z_OUTBOUND_RFC_CSCEN'   " Communication scenario
*      service_id             = 'Z_OUTBOUND_RFC_SRFC'   ).  " Outbound service

        DATA(lo_destination) = cl_rfc_destination_provider=>create_by_cloud_destination(
                                 i_name                  = |OnPrem|
*                            i_service_instance_name =
                               ).


        DATA(lv_destination) = lo_destination->get_destination_name( ).

        DATA lv_result TYPE zif_types_for_system_info=>rfcsi.
        DATA msg TYPE c LENGTH 255.

        CALL FUNCTION 'RFC_GET_SYSTEM_INFO'
          DESTINATION lv_destination
          IMPORTING
            rfcsi_export = lv_result.

        out->write( lv_result ).

      CATCH cx_root INTO DATA(lx_root).
        out->write( lx_root->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
