@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Hierarchy: Read Only: Employee Hierarchy'

define hierarchy ZI_EmployeeHN_HR
  as parent child hierarchy(
    source ZI_Employee_HR
    child to parent association _Manager
    start where
      Manager is initial
    siblings order by
      LastName ascending
  )
{
  key Employee,
      Manager
}
