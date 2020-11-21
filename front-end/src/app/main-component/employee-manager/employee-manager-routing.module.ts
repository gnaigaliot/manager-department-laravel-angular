import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DepartmentEmployeesComponent } from './department/department-employees/department-employees.component';
import { DepartmentSearchComponent } from './department/department-search/department-search.component';
import { EmployeeSearchComponent } from './employee/employee-search/employee-search.component';
import { PositionSearchComponent } from './position/position-search/position-search.component';

const routes: Routes = [
  {
    path: 'departments',
    component: DepartmentSearchComponent
  },
  {
    path: 'employees',
    component: EmployeeSearchComponent
  },
  {
    path: 'positions',
    component: PositionSearchComponent
  },
  {
    path: 'departments/:id/employees',
    component: DepartmentEmployeesComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeManagerRoutingModule { }
