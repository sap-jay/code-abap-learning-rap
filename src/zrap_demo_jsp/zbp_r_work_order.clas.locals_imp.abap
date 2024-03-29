CLASS LHC_WORKORDER DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR workorder
        RESULT result,
      sendInformation FOR MODIFY
            IMPORTING keys FOR ACTION workorder~sendInformation.
ENDCLASS.

CLASS LHC_WORKORDER IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD sendInformation.
  ENDMETHOD.

ENDCLASS.
