@ObjectModel.query.implementedBy: 'ABAP:ZRAPJ_CL_VH_PRODUCT_EXT'
@EndUserText.label: 'Value help for products'
define custom entity ZRAPJI_VH_Product_EXT
{
  key Product : abap.char( 40 );
  ProductText : abap.char( 40 );
  ProductGroup : abap.char( 40 );
  @Semantics.amount.currencyCode: 'Currency'
  Price : abap.curr( 15, 2 );
  Currency : abap.cuky( 5 );
  BaseUnit : abap.unit( 3 );
  
}
