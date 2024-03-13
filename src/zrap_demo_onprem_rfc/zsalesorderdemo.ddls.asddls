@EndUserText.label: 'Abstract Entity for Slaes Order'
@OData.entitySet.name: 'Zsepm_C_Salesorder_SOL'
@OData.entityType.name: 'Zsepm_C_Salesorder_SOLType'
define abstract entity ZSALESORDERDEMO
{
  key SalesOrder                     : abap.char( 10 );
      @Semantics.amount.currencyCode : 'TransactionCurrency'
      NetAmountInTransactionCurrency : abap.dec( 16, 3 );
      @Semantics.amount.currencyCode : 'TransactionCurrency'
      TaxAmountInTransactionCurrency : abap.dec( 16, 3 );
      SalesOrderLifeCycleStatus      : abap.char( 1 );
      SalesOrderBillingStatus        : abap.char( 1 );
      SalesOrderDeliveryStatus       : abap.char( 1 );
      SalesOrderOverallStatus        : abap.char( 1 );
      Opportunity                    : abap.char( 35 );
      SalesOrder_Text                : abap.char( 255 );
      CreationDateTime               : tzntstmpl;
      LastChangedDateTime            : tzntstmpl;
      IsCreatedByBusinessPartner     : abap_boolean;
      IsLastChangedByBusinessPartner : abap_boolean;
      Customer                       : abap.char( 10 );
      @Semantics.currencyCode        : true
      TransactionCurrency            : abap.cuky( 5 );
      @Semantics.amount.currencyCode : 'TransactionCurrency'
      GrossAmountInTransacCurrency   : abap.dec( 16, 3 );

}
