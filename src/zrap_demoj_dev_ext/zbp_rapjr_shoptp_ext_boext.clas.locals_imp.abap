CLASS lhc_Shop DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CONSTANTS state_area_check_delivery_date       TYPE string VALUE 'CHECK_DELIVERYDATE'.
  PRIVATE SECTION.

    METHODS zz_validateDeliverydate FOR VALIDATE ON SAVE
      IMPORTING keys FOR Shop~zz_validateDeliverydate.
    METHODS ZZ_setOverallStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Shop~ZZ_setOverallStatus.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Shop RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Shop RESULT result.

    METHODS ZZ_ProvideFeedback FOR MODIFY
      IMPORTING keys FOR ACTION Shop~ZZ_ProvideFeedback RESULT result.

ENDCLASS.

CLASS lhc_Shop IMPLEMENTATION.

  METHOD zz_validateDeliverydate.

    READ ENTITIES OF ZRAPJR_ShopTP_EXT IN LOCAL MODE
            ENTITY Shop
            FIELDS ( DeliveryDate OverallStatus )
            WITH CORRESPONDING #( keys )
            RESULT DATA(onlineorders).
    LOOP AT onlineorders INTO DATA(onlineorder).
      APPEND VALUE #( %tky           = onlineorder-%tky
                      %state_area    = state_area_check_delivery_date )
             TO reported-shop.
      DATA(deliverydate)             =  onlineorder-DeliveryDate - cl_abap_context_info=>get_system_date(  ).
      IF onlineorder-deliverydate IS INITIAL  .
        APPEND VALUE #( %tky           = onlineorder-%tky ) TO failed-shop.
        APPEND VALUE #( %tky           = onlineorder-%tky
                        %state_area    = state_area_check_delivery_date
                        %msg           = new_message_with_text(
                                            severity = if_abap_behv_message=>severity-error
                                            text     = 'delivery period cannot be initial'
                       ) )
                TO reported-shop.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD ZZ_setOverallStatus.

    DATA : lt_shop TYPE TABLE FOR UPDATE ZRAPJR_ShopTP_EXT,
           lw_shop TYPE STRUCTURE FOR UPDATE ZRAPJR_ShopTP_EXT.


    READ ENTITIES OF ZRAPJR_ShopTP_EXT IN LOCAL MODE
       ENTITY Shop
       FIELDS ( OrderItemPrice OrderID )
       WITH CORRESPONDING #( keys )
       RESULT DATA(onlineorders)
       FAILED DATA(ordards_failed)
       REPORTED DATA(orders_reported).
    LOOP AT onlineorders INTO DATA(onlineorder).
      lw_shop-%tky = onlineorder-%tky.

      IF onlineorder-OrderItemPrice > 200.
        lw_shop-OverallStatus = 'Awaiting Approval'.

      ELSE.

        lw_shop-OverallStatus = 'Automatically Approve'.
      ENDIF.

      lw_shop-OrderItemPrice = 300.
      lw_shop-CurrencyCode = 'EUR'.



      APPEND lw_shop TO lt_shop.
    ENDLOOP.


    MODIFY ENTITIES OF ZRAPJR_ShopTP_EXT IN LOCAL MODE
      ENTITY Shop
      UPDATE FIELDS (
       OverallStatus
       OrderItemPrice
       CurrencyCode ) WITH lt_shop REPORTED DATA(update_reported).


  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ZZ_ProvideFeedback.

    MODIFY ENTITIES OF ZRAPJR_ShopTP_EXT IN LOCAL MODE
        ENTITY Shop
            UPDATE FIELDS ( zz_feedback_zaa )
            WITH VALUE #( FOR key IN keys ( %tky              = key-%tky
                                 zz_feedback_zaa  = key-%param-feedback  ) ).

    "Read the changed data for action result
    READ ENTITIES OF ZRAPJR_ShopTP_EXT IN LOCAL MODE
      ENTITY Shop
        ALL FIELDS WITH
        CORRESPONDING #( keys )
      RESULT DATA(result_read).
    "return result entities
    result = VALUE #( FOR order_2 IN result_read ( %tky   = order_2-%tky
                                                   %param = order_2 ) ).
  ENDMETHOD.

ENDCLASS.
