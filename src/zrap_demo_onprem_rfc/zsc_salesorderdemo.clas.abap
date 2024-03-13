"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZE2E100_SOL_2_SRV</em>
CLASS zsc_salesorderdemo DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">SEPM_I_BusinessPartner_EType</p>
      BEGIN OF tys_sepm_i_business_partner_et,
        "! <em>Key property</em> BusinessPartner
        business_partner           TYPE c LENGTH 10,
        "! BusinessPartnerRole
        business_partner_role      TYPE c LENGTH 3,
        "! Currency
        currency                   TYPE c LENGTH 5,
        "! CompanyName
        company_name               TYPE c LENGTH 80,
        "! LegalForm
        legal_form                 TYPE c LENGTH 10,
        "! EmailAddress
        email_address              TYPE c LENGTH 255,
        "! FaxNumber
        fax_number                 TYPE c LENGTH 30,
        "! PhoneNumber
        phone_number               TYPE c LENGTH 30,
        "! URL
        url                        TYPE string,
        "! CreationDateTime
        creation_date_time         TYPE timestampl,
        "! LastChangedDateTime
        last_changed_date_time     TYPE timestampl,
        "! BuPaApprovalStatus
        bu_pa_approval_status      TYPE c LENGTH 1,
        "! CreatedBySystemUser
        created_by_system_user     TYPE c LENGTH 12,
        "! LastChangedBySystemUser
        last_changed_by_system_use TYPE c LENGTH 12,
        "! CityName
        city_name                  TYPE c LENGTH 40,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! StreetName
        street_name                TYPE c LENGTH 60,
        "! HouseNumber
        house_number               TYPE c LENGTH 10,
        "! Country
        country                    TYPE c LENGTH 3,
      END OF tys_sepm_i_business_partner_et,
      "! <p class="shorttext synchronized">List of SEPM_I_BusinessPartner_EType</p>
      tyt_sepm_i_business_partner_et TYPE STANDARD TABLE OF tys_sepm_i_business_partner_et WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">SEPM_I_SalesOrderItem_EType</p>
      BEGIN OF tys_sepm_i_sales_order_item_et,
        "! <em>Key property</em> ID
        id                         TYPE string,
        "! SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! SalesOrderItem
        sales_order_item           TYPE c LENGTH 10,
        "! SalesOrderItem_Text
        sales_order_item_text      TYPE c LENGTH 255,
        "! Product
        product                    TYPE c LENGTH 10,
        "! TransactionCurrency
        transaction_currency       TYPE c LENGTH 5,
        "! GrossAmountInTransacCurrency
        gross_amount_in_transac_cu TYPE p LENGTH 9 DECIMALS 3,
        "! NetAmountInTransactionCurrency
        net_amount_in_transaction  TYPE p LENGTH 9 DECIMALS 3,
        "! TaxAmountInTransactionCurrency
        tax_amount_in_transaction  TYPE p LENGTH 9 DECIMALS 3,
        "! ProductAvailabilityStatus
        product_availability_statu TYPE c LENGTH 1,
        "! OpportunityItem
        opportunity_item           TYPE c LENGTH 10,
      END OF tys_sepm_i_sales_order_item_et,
      "! <p class="shorttext synchronized">List of SEPM_I_SalesOrderItem_EType</p>
      tyt_sepm_i_sales_order_item_et TYPE STANDARD TABLE OF tys_sepm_i_sales_order_item_et WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Zsepm_C_Salesorder_SOLType</p>
      BEGIN OF tys_zsepm_c_salesorder_soltype,
        "! <em>Key property</em> SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! SalesOrder_Text
        sales_order_text           TYPE c LENGTH 255,
        "! CreationDateTime
        creation_date_time         TYPE timestampl,
        "! LastChangedDateTime
        last_changed_date_time     TYPE timestampl,
        "! IsCreatedByBusinessPartner
        is_created_by_business_par TYPE abap_bool,
        "! IsLastChangedByBusinessPartner
        is_last_changed_by_busines TYPE abap_bool,
        "! Customer
        customer                   TYPE c LENGTH 10,
        "! TransactionCurrency
        transaction_currency       TYPE c LENGTH 5,
        "! GrossAmountInTransacCurrency
        gross_amount_in_transac_cu TYPE p LENGTH 9 DECIMALS 3,
        "! NetAmountInTransactionCurrency
        net_amount_in_transaction  TYPE p LENGTH 9 DECIMALS 3,
        "! TaxAmountInTransactionCurrency
        tax_amount_in_transaction  TYPE p LENGTH 9 DECIMALS 3,
        "! SalesOrderLifeCycleStatus
        sales_order_life_cycle_sta TYPE c LENGTH 1,
        "! SalesOrderBillingStatus
        sales_order_billing_status TYPE c LENGTH 1,
        "! SalesOrderDeliveryStatus
        sales_order_delivery_statu TYPE c LENGTH 1,
        "! SalesOrderOverallStatus
        sales_order_overall_status TYPE c LENGTH 1,
        "! Opportunity
        opportunity                TYPE c LENGTH 35,
      END OF tys_zsepm_c_salesorder_soltype,
      "! <p class="shorttext synchronized">List of Zsepm_C_Salesorder_SOLType</p>
      tyt_zsepm_c_salesorder_soltype TYPE STANDARD TABLE OF tys_zsepm_c_salesorder_soltype WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! SEPM_I_BusinessPartner_E
        "! <br/> Collection of type 'SEPM_I_BusinessPartner_EType'
        sepm_i_business_partner_e TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SEPM_I_BUSINESS_PARTNER_E',
        "! SEPM_I_SalesOrderItem_E
        "! <br/> Collection of type 'SEPM_I_SalesOrderItem_EType'
        sepm_i_sales_order_item_e TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'SEPM_I_SALES_ORDER_ITEM_E',
        "! Zsepm_C_Salesorder_SOL
        "! <br/> Collection of type 'Zsepm_C_Salesorder_SOLType'
        zsepm_c_salesorder_sol    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'ZSEPM_C_SALESORDER_SOL',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for SEPM_I_BusinessPartner_EType</p>
        "! See also structure type {@link ..tys_sepm_i_business_partner_et}
        BEGIN OF sepm_i_business_partner_et,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sepm_i_business_partner_et,
        "! <p class="shorttext synchronized">Internal names for SEPM_I_SalesOrderItem_EType</p>
        "! See also structure type {@link ..tys_sepm_i_sales_order_item_et}
        BEGIN OF sepm_i_sales_order_item_et,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF sepm_i_sales_order_item_et,
        "! <p class="shorttext synchronized">Internal names for Zsepm_C_Salesorder_SOLType</p>
        "! See also structure type {@link ..tys_zsepm_c_salesorder_soltype}
        BEGIN OF zsepm_c_salesorder_soltype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_Customer
            to_customer TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_CUSTOMER',
            "! to_Item
            to_item     TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_ITEM',
          END OF navigation,
        END OF zsepm_c_salesorder_soltype,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define SEPM_I_BusinessPartner_EType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sepm_i_business_partner_et RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define SEPM_I_SalesOrderItem_EType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_sepm_i_sales_order_item_et RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Zsepm_C_Salesorder_SOLType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_zsepm_c_salesorder_soltype RAISING /iwbep/cx_gateway.

ENDCLASS.


CLASS zsc_salesorderdemo IMPLEMENTATION.

  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZE2E100_SOL_2_SRV' ).

    def_sepm_i_business_partner_et( ).
    def_sepm_i_sales_order_item_et( ).
    def_zsepm_c_salesorder_soltype( ).

  ENDMETHOD.


  METHOD def_sepm_i_business_partner_et.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SEPM_I_BUSINESS_PARTNER_ET'
                                    is_structure              = VALUE tys_sepm_i_business_partner_et( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SEPM_I_BusinessPartner_EType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SEPM_I_BUSINESS_PARTNER_E' ).
    lo_entity_set->set_edm_name( 'SEPM_I_BusinessPartner_E' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER' ).
    lo_primitive_property->set_edm_name( 'BusinessPartner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PARTNER_ROLE' ).
    lo_primitive_property->set_edm_name( 'BusinessPartnerRole' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CURRENCY' ).
    lo_primitive_property->set_edm_name( 'Currency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_NAME' ).
    lo_primitive_property->set_edm_name( 'CompanyName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LEGAL_FORM' ).
    lo_primitive_property->set_edm_name( 'LegalForm' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EMAIL_ADDRESS' ).
    lo_primitive_property->set_edm_name( 'EmailAddress' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FAX_NUMBER' ).
    lo_primitive_property->set_edm_name( 'FaxNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PHONE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PhoneNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'URL' ).
    lo_primitive_property->set_edm_name( 'URL' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'CreationDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGED_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'LastChangedDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BU_PA_APPROVAL_STATUS' ).
    lo_primitive_property->set_edm_name( 'BuPaApprovalStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY_SYSTEM_USER' ).
    lo_primitive_property->set_edm_name( 'CreatedBySystemUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGED_BY_SYSTEM_USE' ).
    lo_primitive_property->set_edm_name( 'LastChangedBySystemUser' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'CityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'PostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_NAME' ).
    lo_primitive_property->set_edm_name( 'StreetName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_NUMBER' ).
    lo_primitive_property->set_edm_name( 'HouseNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_sepm_i_sales_order_item_et.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'SEPM_I_SALES_ORDER_ITEM_ET'
                                    is_structure              = VALUE tys_sepm_i_sales_order_item_et( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'SEPM_I_SalesOrderItem_EType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'SEPM_I_SALES_ORDER_ITEM_E' ).
    lo_entity_set->set_edm_name( 'SEPM_I_SalesOrderItem_E' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'ID' ).
    lo_primitive_property->set_edm_name( 'ID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem_Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT' ).
    lo_primitive_property->set_edm_name( 'Product' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSACTION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'TransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROSS_AMOUNT_IN_TRANSAC_CU' ).
    lo_primitive_property->set_edm_name( 'GrossAmountInTransacCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_AMOUNT_IN_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'NetAmountInTransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_AMOUNT_IN_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'TaxAmountInTransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_AVAILABILITY_STATU' ).
    lo_primitive_property->set_edm_name( 'ProductAvailabilityStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OPPORTUNITY_ITEM' ).
    lo_primitive_property->set_edm_name( 'OpportunityItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_zsepm_c_salesorder_soltype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'ZSEPM_C_SALESORDER_SOLTYPE'
                                    is_structure              = VALUE tys_zsepm_c_salesorder_soltype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Zsepm_C_Salesorder_SOLType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'ZSEPM_C_SALESORDER_SOL' ).
    lo_entity_set->set_edm_name( 'Zsepm_C_Salesorder_SOL' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_TEXT' ).
    lo_primitive_property->set_edm_name( 'SalesOrder_Text' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'CreationDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LAST_CHANGED_DATE_TIME' ).
    lo_primitive_property->set_edm_name( 'LastChangedDateTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_CREATED_BY_BUSINESS_PAR' ).
    lo_primitive_property->set_edm_name( 'IsCreatedByBusinessPartner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_LAST_CHANGED_BY_BUSINES' ).
    lo_primitive_property->set_edm_name( 'IsLastChangedByBusinessPartner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CUSTOMER' ).
    lo_primitive_property->set_edm_name( 'Customer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TRANSACTION_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'TransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROSS_AMOUNT_IN_TRANSAC_CU' ).
    lo_primitive_property->set_edm_name( 'GrossAmountInTransacCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_AMOUNT_IN_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'NetAmountInTransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_AMOUNT_IN_TRANSACTION' ).
    lo_primitive_property->set_edm_name( 'TaxAmountInTransactionCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ).
    lo_primitive_property->set_scale( 3 ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_LIFE_CYCLE_STA' ).
    lo_primitive_property->set_edm_name( 'SalesOrderLifeCycleStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_BILLING_STATUS' ).
    lo_primitive_property->set_edm_name( 'SalesOrderBillingStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_DELIVERY_STATU' ).
    lo_primitive_property->set_edm_name( 'SalesOrderDeliveryStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_OVERALL_STATUS' ).
    lo_primitive_property->set_edm_name( 'SalesOrderOverallStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OPPORTUNITY' ).
    lo_primitive_property->set_edm_name( 'Opportunity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ).
    lo_primitive_property->set_scale_floating( ).
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_CUSTOMER' ).
    lo_navigation_property->set_edm_name( 'to_Customer' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SEPM_I_BUSINESS_PARTNER_ET' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_ITEM' ).
    lo_navigation_property->set_edm_name( 'to_Item' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'SEPM_I_SALES_ORDER_ITEM_ET' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


ENDCLASS.
