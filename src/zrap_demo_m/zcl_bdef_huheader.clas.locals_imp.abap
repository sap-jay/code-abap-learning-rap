    CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
      PRIVATE SECTION.
        CONSTANTS:
          BEGIN OF hu_status,
            open          TYPE c LENGTH 1  VALUE 'O', " Open
            pick          TYPE c LENGTH 1  VALUE 'P', " Picked
            canceled      TYPE c LENGTH 1  VALUE 'X', " Cancelled
            pack          TYPE c LENGTH 1  VALUE 'A', " Packed
            pickcompleate TYPE c LENGTH 1  VALUE  'C', " Pick-Compleate
          END OF hu_status.

        METHODS get_instance_features FOR INSTANCE FEATURES
          IMPORTING keys REQUEST requested_features FOR Header RESULT result.

        METHODS notifyHUPacked FOR MODIFY
          IMPORTING keys FOR ACTION Header~notifyHUPacked.

        METHODS setHUStatus FOR MODIFY
          IMPORTING keys FOR ACTION Header~setHUStatus RESULT result.

        METHODS setInitialStatus FOR DETERMINE ON MODIFY
          IMPORTING keys FOR Header~setInitialStatus.

        METHODS validateCustomer FOR VALIDATE ON SAVE
          IMPORTING keys FOR Header~validateCustomer.
        METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
          IMPORTING REQUEST requested_authorizations FOR Header RESULT result.
        METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
          IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    ENDCLASS.

    CLASS lhc_Header IMPLEMENTATION.

      METHOD get_instance_features.

        " Read the travel status of the existing travels
        READ ENTITIES OF ZI_HUHeader IN LOCAL MODE
          ENTITY Header
            FIELDS ( Scode ) WITH CORRESPONDING #( keys )
          RESULT DATA(headers)
          FAILED failed.

        result =
          VALUE #(
            FOR header IN headers
              LET is_packed =   COND #( WHEN Header-Scode = Hu_status-pack
                                        THEN if_abap_behv=>fc-o-disabled
                                        ELSE if_abap_behv=>fc-o-enabled  )
              IN
                ( %tky                 = Header-%tky
                  %action-setHUStatus  = is_packed ) ).

      ENDMETHOD.

      METHOD notifyHUPacked.
      ENDMETHOD.

      METHOD setHUStatus.
        " Set the new status
        MODIFY ENTITIES OF ZI_HUHeader IN LOCAL MODE
        ENTITY Header
           UPDATE
             FIELDS ( Scode Status )
             WITH VALUE #( FOR key IN keys
                             ( %tky         = key-%tky
                               Scode        = Hu_status-pack
                               Status       = 'PACKED' ) )
        FAILED failed
        REPORTED reported.

        " Fill the response table
        READ ENTITIES OF ZI_HUHeader IN LOCAL MODE
          ENTITY Header
            ALL FIELDS WITH CORRESPONDING #( keys )
          RESULT DATA(headers).

        result = VALUE #( FOR header IN headers
                            ( %tky   = header-%tky  "transactional key
                              %param = header ) ).

*       In non-draft use cases – like the present one –, %tky contains the same value as %key which is the key of the related entity.
*       In draft-enabled use cases, %tky will automatically contain the is_draft indicator.
      ENDMETHOD.

      METHOD setInitialStatus.
*       Determinations need to be idempotent – which means the result may not differ even if they are executed multiple times for the same key
        " Read relevant travel instance data
        READ ENTITIES OF ZI_HUHeader IN LOCAL MODE
          ENTITY Header
            FIELDS ( Scode Status ) WITH CORRESPONDING #( keys )
          RESULT DATA(headers).

        " Remove all headers instance data with open status
        DELETE headers WHERE Scode IS NOT INITIAL.
        CHECK headers IS NOT INITIAL.

        " Set default header status
        MODIFY ENTITIES OF ZI_HUHeader IN LOCAL MODE
        ENTITY header
          UPDATE
            FIELDS ( Scode Status )
            WITH VALUE #( FOR header IN headers
                          ( %tky   = header-%tky
                            Scode  = Hu_status-open
                            Status = 'OPEN'  ) )
        REPORTED DATA(update_reported).

        reported = CORRESPONDING #( DEEP update_reported ).
      ENDMETHOD.

      METHOD validateCustomer.
      ENDMETHOD.

      METHOD get_instance_authorizations.

        DATA : edit_request     TYPE abap_bool,
               delete_requested TYPE abap_bool,
               edit_granted     TYPE abap_bool,
               delete_granted   TYPE abap_bool.

        edit_request =  COND #( WHEN requested_authorizations-%update = if_abap_behv=>mk-on
                                  THEN abap_true ELSE abap_false ).

        delete_requested =  COND #( WHEN requested_authorizations-%delete = if_abap_behv=>mk-on
        THEN abap_true ELSE abap_false ).


*        Authority-check object 'ZHUAUTHOBJ'


        READ ENTITIES OF ZI_HUHeader IN LOCAL MODE
        ENTITY Header
          FIELDS ( GuidHu ) WITH CORRESPONDING #( keys )
        RESULT DATA(headers)
        FAILED failed.
        LOOP AT headers INTO DATA(header).
          IF edit_request = abap_true.
            edit_granted = abap_false.

            IF edit_granted = abap_false.
              APPEND VALUE #( %tky = header-%tky ) TO failed-header.
              APPEND VALUE #( %tky = keys[ 1 ]-%tky
                              %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                                text = 'Not Authorised' ) ) TO reported-header.
            ENDIF.
          ENDIF.


        ENDLOOP.

      ENDMETHOD.

      METHOD get_global_authorizations.

        DATA : create_request TYPE abap_bool,
               create_granted TYPE abap_bool.

        create_request =  COND #( WHEN requested_authorizations-%create = if_abap_behv=>mk-on
                                          THEN abap_true ELSE abap_false ).


      ENDMETHOD.

    ENDCLASS.
