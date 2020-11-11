import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DepartmentSearchComponent } from './department/department-search/department-search.component';
import { EmployeeSearchComponent } from './employee/employee-search/employee-search.component';

const routes: Routes = [
  {
    path: 'departments',
    component: DepartmentSearchComponent
  },
  {
    path: 'employees',
    component: EmployeeSearchComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeManagerRoutingModule { }
