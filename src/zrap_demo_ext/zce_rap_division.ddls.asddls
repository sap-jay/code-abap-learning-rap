@EndUserText.label: 'Custom entity for divisions from ES5'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_CE_RAPSALESDIVISION'
@UI.headerInfo: {
    typeName: 'Sales Division/Agency',
    typeNamePlural: 'Sales Division/Agencies',
    title: {
        type: #STANDARD,
        value: 'Agency_Id'
    },
    description: {
        type: #STANDARD,
        value: 'Name'
    }
}
define root custom entity ZCE_RAP_DIVISION
{
      @EndUserText.label: 'Division'
      @UI.selectionField: [{position: 10 }]
      @UI.lineItem   : [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
      @Consumption.filter.selectionType: #INTERVAL
  key Agency_Id      : abap.char( 6 );
      @OData.property.valueControl: 'Name_vc'
      @EndUserText.label: 'Name'
      @UI.lineItem   : [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
      Name           : abap.char( 31 );
      Name_vc        : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Street_vc'
      @EndUserText.label: 'Street'
      @UI.selectionField: [{position: 40 }]
      @UI.lineItem   : [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
      Street         : abap.char( 30 );
      Street_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl: 'PostalCode_vc'
      @EndUserText.label: 'Postal Code'
      @UI.lineItem   : [{ position: 40 }]
      @UI.identification: [{ position: 40 }]
      Postal_Code    : abap.char( 10 );
      PostalCode_vc  : rap_cp_odata_value_control;
      @OData.property.valueControl: 'City_vc'
      @EndUserText.label: 'City'
      @UI.identification: [{ position: 10 }]
      @UI.lineItem   : [{ position: 50 }]
      City           : abap.char( 25 );
      City_vc        : rap_cp_odata_value_control;
      @EndUserText.label: 'Country'
      @OData.property.valueControl: 'Country_vc'
      @UI.lineItem   : [{ position: 60 }]
      @UI.identification: [{ position: 50 }]
      Country        : abap.char( 3 );
      Country_vc     : rap_cp_odata_value_control;
      @OData.property.valueControl: 'PhoneNumber_vc'
      @EndUserText.label: 'Phone Number'
      @UI.lineItem   : [{ position: 70 }]
      @UI.selectionField: [{position: 20 }]
      @UI.identification: [{ position: 60 }]
      PhoneNumber    : abap.char( 30 );
      PhoneNumber_vc : rap_cp_odata_value_control;
      @OData.property.valueControl: 'WebAddress_vc'
      @EndUserText.label: 'Web Address'
      @UI.lineItem   : [{ position: 80 }]
      @UI.identification: [{ position: 70 }]
      Web_Address    : abap.char( 255 );
      WebAddress_vc  : rap_cp_odata_value_control;

}
