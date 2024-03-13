@OData.entitySet.name: 'ZRAP_SalesDivision_ES5'
@OData.entityType.name: 'ZRAP_SalesDivision_ES5Type'
@EndUserText.label: 'Service Consumption For Sales Divisions from ES5'
define root abstract entity ZRAP_SalesDivision_ES5
{
  key Agency_Id      : abap.char( 6 );
      @OData.property.valueControl: 'Name_vc'
      Name           : abap.char( 31 );
      Name_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Street_vc'
      Street         : abap.char( 30 );
      Street_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl: 'PostalCode_vc'
      Postal_Code    : abap.char( 10 );
      PostalCode_vc  : rap_cp_odata_value_control;
      @OData.property.valueControl: 'City_vc'
      City           : abap.char( 25 );
      City_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Country_vc'
      Country        : abap.char( 3 );
      Country_vc     : rap_cp_odata_value_control;
      @OData.property.valueControl: 'PhoneNumber_vc'
      PhoneNumber    : abap.char( 30 );
      PhoneNumber_vc : rap_cp_odata_value_control;
      @OData.property.valueControl: 'WebAddress_vc'
      Web_Address    : abap.char( 255 );
      WebAddress_vc  : rap_cp_odata_value_control;
}
