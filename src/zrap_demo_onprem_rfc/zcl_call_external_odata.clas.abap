CLASS zcl_call_external_odata DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
    DATA salesorders TYPE STANDARD TABLE OF zsalesorderdemo.
  PRIVATE SECTION.

    METHODS get_http_client
      IMPORTING base_url           TYPE string
      RETURNING VALUE(http_client) TYPE REF TO if_web_http_client
      RAISING
                cx_web_http_client_error
                cx_http_dest_provider_error.

    METHODS get_odata_response
      IMPORTING http_client TYPE REF TO if_web_http_client
      EXPORTING entityset   LIKE salesorders
      RAISING
                cx_web_http_client_error
                /iwbep/cx_gateway.
ENDCLASS.



CLASS zcl_call_external_odata IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA base_url TYPE string.
    base_url = 'https://sapes5.sapdevcenter.com/'.

    TRY.
        DATA(http_client) = get_http_client( base_url = base_url ).
      CATCH cx_web_http_client_error cx_http_dest_provider_error INTO DATA(error_creating_http_client).
        out->write( error_creating_http_client->get_longtext(  )  ).
        EXIT.
    ENDTRY.

    TRY.
        get_odata_response(
         EXPORTING http_client = http_client
         IMPORTING entityset = DATA(salesorders) ).
      CATCH cx_web_http_client_error /iwbep/cx_gateway INTO DATA(error_calling_OData_service).
        "handle exception
        out->write( error_calling_OData_service->get_longtext(  )  ).
        EXIT.
    ENDTRY.

    LOOP AT salesorders INTO DATA(salesorder).
      out->write( salesorder ).
    ENDLOOP.

  ENDMETHOD.

  METHOD get_http_client.
    http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination =  cl_http_destination_provider=>create_by_url( i_url = base_url ) ).

    http_client->get_http_request( )->set_authorization_basic(
        i_username = 'S0019132601'
        i_password = 'words@123'
    ).
  ENDMETHOD.


  METHOD get_odata_response.

    DATA entity LIKE LINE OF entityset.
    DATA range_for_salesorders LIKE RANGE OF entity-salesorder.
    DATA range_for_salesorders2 LIKE RANGE OF entity-salesorder.
    DATA range_for_netamounts LIKE RANGE OF entity-netamountintransactioncurrency.
    DATA range_for_netamounts2 LIKE RANGE OF entity-netamountintransactioncurrency.
    DATA(client_proxy) = cl_web_odata_client_factory=>create_v2_remote_proxy(
      EXPORTING
        iv_service_definition_name = 'ZSC_SALESORDERDEMO'
        io_http_client             = http_client
        iv_relative_service_root   = '/sap/opu/odata/sap/ZE2E100_SOL_2_SRV/' ).

    DATA(odata_request) = client_proxy->create_resource_for_entity_set( 'ZSEPM_C_SALESORDER_SOL' )->create_request_for_read( ).

    odata_request->set_top( 5 )->set_skip( 0 ).

* filter
    range_for_salesorders = VALUE #(
      ( sign = 'I' option = 'GE' low = '500000100' ) ).
    range_for_netamounts = VALUE #(
      ( sign = 'I' option = 'LE' low = '8000' ) ).
    range_for_netamounts2 = VALUE #(
      ( sign = 'I' option = 'GE' low = '3000' ) ).
    DATA(filter_factory) = odata_request->create_filter_factory( ).
    DATA(filter_child_node_1)  = filter_factory->create_by_range( iv_property_path     = 'SALESORDER'
                                                                  it_range             = range_for_salesorders ).
    DATA(filter_child_node_2)  = filter_factory->create_by_range( iv_property_path     = 'NETAMOUNTINTRANSACTIONCURRENCY'
                                                                  it_range             = range_for_netamounts
                                                                  iv_currency_code     = 'USD' ).
    DATA(filter_child_node_3)  = filter_factory->create_by_range( iv_property_path     = 'NETAMOUNTINTRANSACTIONCURRENCY'
                                                                  it_range             = range_for_netamounts2
                                                                  iv_currency_code     = 'USD' ).
    DATA(filter_root_node) = filter_child_node_1->and( filter_child_node_2->and( filter_child_node_3 ) ).
    odata_request->set_filter( filter_root_node ).

* retrieve business data
    DATA(odata_response) = odata_request->execute( ).
    odata_response->get_business_data( IMPORTING et_business_data = entityset ).

  ENDMETHOD.
ENDCLASS.
