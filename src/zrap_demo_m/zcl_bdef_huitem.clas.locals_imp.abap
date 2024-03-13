    CLASS lhc_Item DEFINITION INHERITING FROM cl_abap_behavior_handler.
      PRIVATE SECTION.

        METHODS setdocguid FOR DETERMINE ON SAVE
          IMPORTING keys FOR Item~setdocguid.

    ENDCLASS.

    CLASS lhc_Item IMPLEMENTATION.

      METHOD setdocguid.

        DATA update TYPE TABLE FOR UPDATE ZI_HUItem.


        " Read all HUs for the requested Stocks.
        " If multiple Stocks of the same HU are requested, the HU is returned only once.
        READ ENTITIES OF ZI_HUHeader IN LOCAL MODE
        ENTITY Item BY \_Header
        FIELDS ( GuidHu )
        WITH CORRESPONDING #( keys )
        RESULT DATA(headers).

        LOOP AT headers INTO DATA(header).
          READ ENTITIES OF ZI_HUHeader IN LOCAL MODE
            ENTITY Header BY \_Item
            FIELDS ( GuidStock Docid Docitmid )
            WITH VALUE #( ( %tky = header-%tky ) )
        RESULT DATA(stocks).
        ENDLOOP.

        " Provide a booking ID for all bookings that have none.
        LOOP AT stocks INTO DATA(stock).
          IF stock-Docid IS INITIAL.
            APPEND VALUE #( %tky      = stock-%tky
                            docid     = NEW cl_system_uuid( )->if_system_uuid~create_uuid_x16( )
                            docitmid  = NEW cl_system_uuid( )->if_system_uuid~create_uuid_x16( )
                          ) TO update.
          ENDIF.
        ENDLOOP.


        " Update the Booking ID of all relevant bookings
        MODIFY ENTITIES OF ZI_HUHeader IN LOCAL MODE
        ENTITY Item
          UPDATE FIELDS ( Docid Docitmid ) WITH update
        REPORTED DATA(update_reported).

        reported = CORRESPONDING #( DEEP update_reported ).

      ENDMETHOD.

    ENDCLASS.
