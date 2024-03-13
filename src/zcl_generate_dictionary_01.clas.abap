CLASS zcl_generate_dictionary_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_dictionary_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_package) = xco_cp_abap_repository=>package->for( 'ZRAP_DMO_XCO' ).

    DATA(lv_transport_target) = lo_package->read(
      )-property-transport_layer->get_transport_target(
      )->value.

    DATA(lo_transport_request) = xco_cp_cts=>transports->workbench( lv_transport_target
      )->create_request( 'My XCO Demo TR' ).

    DATA(lo_put_operation) = xco_cp_generation=>environment->dev_system( lo_transport_request->value
    )->create_put_operation( ).

    " Add the database table to the PUT operation.
    DATA(lo_database_table) = lo_put_operation->for-tabl-for-database_table->add_object( 'ZXCO_DBT_DMO'
      )->set_package( lo_package->name
      )->create_form_specification( ).
    lo_database_table->set_short_description( 'My generated database table' ).
    lo_database_table->set_delivery_class( xco_cp_database_table=>delivery_class->l ).
    lo_database_table->set_data_maintenance( xco_cp_database_table=>data_maintenance->allowed ).

    lo_database_table->add_field( 'KEY_FIELD'
      )->set_key_indicator(
      )->set_type( xco_cp_abap_dictionary=>built_in_type->char( 30 )
      )->set_not_null( ).

    " Further fields (including information about foreign keys, search helps, etc.) can be
    " added following the same pattern.

    " Add the data definition for the CDS view entity to the PUT operation
    DATA(lo_data_definition) = lo_put_operation->for-ddls->add_object( 'ZXCO_VIEW_ENTITY'
      )->set_package( lo_package->name
      )->create_form_specification( ).
    lo_data_definition->set_short_description( 'My generated view entity' ).

    DATA(lo_view_entity) = lo_data_definition->add_view_entity( ).
    lo_view_entity->data_source->set_view_entity( 'ZXCO_DBT_DMO' ).

    DATA(lo_key_field) = lo_view_entity->add_field( xco_cp_ddl=>field( 'KEY_FIELD' ) ).
    lo_key_field->set_key( )->set_alias( 'keyField' ).
    lo_key_field->add_annotation( 'EndUserText.label' )->value->build( )->add_string( 'Key field' ).

    lo_put_operation->execute( ).

  ENDMETHOD.
ENDCLASS.
