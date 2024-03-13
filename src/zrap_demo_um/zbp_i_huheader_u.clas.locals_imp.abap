    CLASS lcl_buffer DEFINITION.
      PUBLIC SECTION.

        TYPES: BEGIN OF ty_buffer.
                 INCLUDE TYPE zgmhuhdr  AS lv_data.
        TYPES:   flag TYPE c LENGTH 1,
               END OF ty_buffer.

        CLASS-DATA mt_buffer TYPE TABLE OF ty_buffer.

    ENDCLASS.


    CLASS lhc_huheader DEFINITION INHERITING FROM cl_abap_behavior_handler.
      PRIVATE SECTION.


        METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
          IMPORTING keys REQUEST requested_authorizations FOR huheader RESULT result.

        METHODS create FOR MODIFY
          IMPORTING entities FOR CREATE huheader.

        METHODS update FOR MODIFY
          IMPORTING entities FOR UPDATE huheader.

        METHODS delete FOR MODIFY
          IMPORTING keys FOR DELETE huheader.

        METHODS read FOR READ
          IMPORTING keys FOR READ huheader RESULT result.

        METHODS lock FOR LOCK
          IMPORTING keys FOR LOCK huheader.

        METHODS rba_Huitem FOR READ
          IMPORTING keys_rba FOR READ huheader\_Huitem FULL result_requested RESULT result LINK association_links.

        METHODS cba_Huitem FOR MODIFY
          IMPORTING entities_cba FOR CREATE huheader\_Huitem.

    ENDCLASS.

    CLASS lhc_huheader IMPLEMENTATION.

      METHOD get_instance_authorizations.
      ENDMETHOD.

      METHOD create.

        DATA ls_gmhuhdr TYPE zgmhuhdr.

        LOOP AT entities ASSIGNING FIELD-SYMBOL(<entity>).
          ls_gmhuhdr = CORRESPONDING #( <entity> MAPPING FROM ENTITY USING CONTROL ).
          INSERT VALUE #( flag = 'C' lv_data = CORRESPONDING #( <entity>-%data ) ) INTO TABLE  lcl_buffer=>mt_buffer.

          IF sy-subrc = 0.
            APPEND VALUE #( %cid   = <entity>-%cid ) TO mapped-huheader.
          ELSE.
            APPEND VALUE #( GuidHu = ls_gmhuhdr-guid_hu  ) TO failed-huheader.
            APPEND VALUE #( GuidHu = ls_gmhuhdr-guid_hu
                            %msg = new_message( id = 'UM'
                                                number = '400'
                                                v1 = 'Error'
                                                severity = CONV #( 'E' )  ) )  TO reported-huheader.

          ENDIF.

        ENDLOOP.


      ENDMETHOD.

      METHOD update.
      ENDMETHOD.

      METHOD delete.
      ENDMETHOD.

      METHOD read.
      ENDMETHOD.

      METHOD lock.
      ENDMETHOD.

      METHOD rba_Huitem.
      ENDMETHOD.

      METHOD cba_Huitem.
      ENDMETHOD.

    ENDCLASS.

    CLASS lsc_ZI_HUHEADER_U DEFINITION INHERITING FROM cl_abap_behavior_saver.
      PROTECTED SECTION.

        METHODS finalize REDEFINITION.

        METHODS check_before_save REDEFINITION.

        METHODS save REDEFINITION.

        METHODS cleanup REDEFINITION.

        METHODS cleanup_finalize REDEFINITION.

    ENDCLASS.

    CLASS lsc_ZI_HUHEADER_U IMPLEMENTATION.

      METHOD finalize.
      ENDMETHOD.

      METHOD check_before_save.
      ENDMETHOD.

      METHOD save.
      ENDMETHOD.

      METHOD cleanup.
      ENDMETHOD.

      METHOD cleanup_finalize.
      ENDMETHOD.

    ENDCLASS.
