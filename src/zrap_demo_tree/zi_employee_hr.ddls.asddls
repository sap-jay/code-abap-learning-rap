@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Hierarchy: Read Only: Employee'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Employee_HR
  as select from zjemployee_hr
  association of many to one ZI_Employee_HR as _Manager on $projection.Manager = _Manager.Employee
{
  key employee        as Employee,
      first_name      as FirstName,
      last_name       as LastName,
      @Semantics.amount.currencyCode: 'SalaryCurrency'
      salary          as Salary,
      salary_currency as SalaryCurrency,
      @EndUserText.label: 'Manager'
      manager         as Manager,

      _Manager
}
