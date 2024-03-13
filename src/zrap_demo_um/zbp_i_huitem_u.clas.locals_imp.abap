CLASS lhc_hustock DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE hustock.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE hustock.

    METHODS read FOR READ
      IMPORTING keys FOR READ hustock RESULT result.

    METHODS rba_Huheader FOR READ
      IMPORTING keys_rba FOR READ hustock\_Huheader FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_hustock IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Huheader.
  ENDMETHOD.

ENDCLASS.
