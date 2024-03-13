CLASS zcl_generate_dictionary DEFINITION
  PUBLIC
  INHERITING FROM cl_xco_cp_adt_simple_classrun
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS main REDEFINITION.
  PRIVATE SECTION.

    DATA package_name  TYPE sxco_package VALUE  'ZRAP_DEMO_XCO'.
    DATA unique_number TYPE string VALUE 'J'.


    DATA dev_system_environment TYPE REF TO if_xco_cp_gen_env_dev_system.
    DATA transport TYPE    sxco_transport .


    TYPES: BEGIN OF t_table_fields,
             field         TYPE sxco_ad_field_name,
             data_element  TYPE sxco_ad_object_name,
             is_key        TYPE abap_bool,
             not_null      TYPE abap_bool,
             currencyCode  TYPE sxco_cds_field_name,
             unitOfMeasure TYPE sxco_cds_field_name,
           END OF t_table_fields.


    TYPES: tt_fields TYPE STANDARD TABLE OF t_table_fields WITH KEY field.


    METHODS put_table  IMPORTING io_put_operation        TYPE REF TO if_xco_cp_gen_d_o_put
                                 table_fields            TYPE tt_fields
                                 table_name              TYPE sxco_dbt_object_name
                                 table_short_description TYPE if_xco_cp_gen_tabl_dbt_s_form=>tv_short_description .


ENDCLASS.



CLASS zcl_generate_dictionary IMPLEMENTATION.


  METHOD main.
    DATA(lo_package) = xco_cp_abap_repository=>object->devc->for( package_name  ).
    DATA(lv_package_software_component) = lo_package->read( )-property-software_component->name.
    DATA(lo_transport_layer) = lo_package->read(  )-property-transport_layer.
    DATA(lo_transport_target) = lo_transport_layer->get_transport_target( ).
    DATA(lv_transport_target) = lo_transport_target->value.
    DATA(lo_transport_request) = xco_cp_cts=>transports->workbench( lo_transport_target->value  )->create_request( | create tables |  ).
    DATA(lv_transport) = lo_transport_request->value.
    transport = lv_transport.
    dev_system_environment = xco_cp_generation=>environment->dev_system( lv_transport ).


    IF NOT lo_package->exists( ).


*      RAISE EXCEPTION TYPE zcx_rap_generator
*        EXPORTING
*          textid   = zcx_rap_generator=>package_does_not_exist
*          mv_value = CONV #( package_name ).


    ENDIF.


    " Execute the PUT operation for the objects in the .
    DATA(lo_objects_put_operation) = dev_system_environment->create_put_operation( ).




    DATA(table_booking_fields) = VALUE tt_fields(
               ( field = 'client'
                 data_element      = 'mandt'
                 is_key    = 'X'
                 not_null  = 'X' )
               ( field = 'booking_uuid '
                 data_element      = 'sysuuid_x16'
                 is_key    = 'X'
                 not_null  = 'X' )
               ( field = 'travel_uuid'
                 data_element      = 'sysuuid_x16'
                 not_null  = 'X' )
               ( field = 'booking_id'
                 data_element      = '/dmo/booking_id' )
               ( field = 'customer_id'
                 data_element      = '/dmo/customer_id' )
               ( field = 'carrier_id'
                 data_element      = '/dmo/carrier_id' )
               ( field = 'connection_id'
                 data_element      = '/dmo/connection_id' )
               ( field = 'flight_date'
                 data_element      = '/dmo/flight_date' )
               ( field = 'flight_price'
                 data_element      = '/dmo/flight_price'
                 currencycode  = 'currency_code'  )
               ( field = 'currency_code'
                 data_element      = '/dmo/currency_code' )
               ( field = 'created_by'
                 data_element      = 'syuname' )
               ( field = 'last_changed_by'
                 data_element      = 'syuname' )
               ( field = 'local_last_changed_at '
                 data_element      = 'timestampl' )
                 ).


    DATA(table_travel_fields) = VALUE tt_fields(
              ( field = 'client'
                data_element      = 'mandt'
                is_key    = 'X'
                not_null  = 'X' )
              ( field = 'travel_uuid'
                data_element      = 'sysuuid_x16'
                is_key    = 'X'
                not_null  = 'X' )
              ( field = 'travel_id'
                data_element      = '/dmo/travel_id' )
              ( field = 'agency_id'
                data_element      = '/dmo/agency_id' )
              ( field = 'customer_id'
                data_element      = '/dmo/customer_id' )
              ( field = 'begin_date'
                data_element      = '/dmo/begin_date' )
              ( field = 'end_date'
                data_element      = '/dmo/end_date' )
              ( field = 'booking_fee'
                data_element      = '/dmo/booking_fee'
                currencycode  = 'currency_code' )
              ( field = 'total_price'
                data_element      = '/dmo/total_price'
                currencycode  = 'currency_code' )
              ( field = 'currency_code'
                data_element      = '/dmo/currency_code' )
              ( field = 'description'
                data_element      = '/dmo/description' )
              ( field = 'overall_status'
                data_element      = '/dmo/overall_status' )
              ( field = 'created_by'
                data_element      = 'syuname' )
              ( field = 'created_at'
                data_element      = 'timestampl' )
              ( field = 'last_changed_by'
                data_element      = 'syuname' )
              ( field = 'last_changed_at'
                data_element      = 'timestampl' )
              ( field = 'local_last_changed_at '
                data_element      = 'timestampl' )
                ).


    put_table(
      EXPORTING
        io_put_operation        = lo_objects_put_operation
        table_fields            = table_travel_fields
        table_name              = |ZRAP_ATRAV_{ unique_number }|
        table_short_description = 'Travel data'
    ).


    put_table(
      EXPORTING
        io_put_operation        = lo_objects_put_operation
        table_fields            = table_BOOKING_fields
        table_name              = |ZRAP_ABOOK_{ unique_number }|
        table_short_description = 'Booking data'
    ).


    DATA(lo_result) = lo_objects_put_operation->execute( ).


    out->write( 'tables created' ).


    DATA(lo_findings) = lo_result->findings.
    DATA(lt_findings) = lo_findings->get( ).


    IF lt_findings IS NOT INITIAL.
      out->write( lt_findings ).
    ENDIF.
  ENDMETHOD.

  METHOD put_table.


    DATA(lo_specification) = io_put_operation->for-tabl-for-database_table->add_object( table_name
              )->set_package( package_name
               )->create_form_specification( ).


    lo_specification->set_short_description( table_short_description ).


    DATA database_table_field  TYPE REF TO if_xco_gen_tabl_dbt_s_fo_field  .


    LOOP AT table_fields INTO DATA(table_field_line).
      database_table_field = lo_specification->add_field( table_field_line-field  ).
      database_table_field->set_type( xco_cp_abap_dictionary=>data_element( table_field_line-data_element ) ).
      IF table_field_line-is_key = abap_true.
        database_table_field->set_key_indicator( ).
      ENDIF.
      IF table_field_line-not_null = abap_true.
        database_table_field->set_not_null( ).
      ENDIF.
      IF table_field_line-currencycode IS NOT INITIAL.
        database_table_field->currency_quantity->set_reference_table( CONV #( to_upper( table_name ) ) )->set_reference_field( to_upper( table_field_line-currencycode ) ).
      ENDIF.
      IF table_field_line-unitofmeasure IS NOT INITIAL.
        database_table_field->currency_quantity->set_reference_table( CONV #( to_upper( table_name ) ) )->set_reference_field( to_upper( table_field_line-unitofmeasure ) ).
      ENDIF.
    ENDLOOP.


  ENDMETHOD.
ENDCLASS.
