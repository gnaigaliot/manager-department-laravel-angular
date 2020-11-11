import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DepartmentSearchComponent } from './department/department-search/department-search.component';

const routes: Routes = [
  {
    path: 'departments',
    component: DepartmentSearchComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeeManagerRoutingModule { }
