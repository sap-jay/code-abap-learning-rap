@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Hierarchy: Read Only: Employee'

@Metadata.allowExtensions: true
@Search.searchable: true

@OData.hierarchy.recursiveHierarchy:[{ entity.name: 'ZI_EmployeeHN_HR' }]

define view entity ZC_Employee_HR
  as select from ZI_Employee_HR

  association of many to one ZC_Employee_HR as _Manager on $projection.Manager = _Manager.Employee
{
  key Employee,

      @Search: {
          defaultSearchElement: true,
          fuzzinessThreshold:  0.87
        }
      FirstName,

      @Search: {
          defaultSearchElement: true,
          fuzzinessThreshold:  0.87
        }
      LastName,

      Salary,
      SalaryCurrency,
      Manager,
      /* Associations */
      _Manager
}
