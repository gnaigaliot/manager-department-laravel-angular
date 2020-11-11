import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeeManagerRoutingModule } from './employee-manager-routing.module';
import { DepartmentIndexComponent } from './department/department-index/department-index.component';
import { DepartmentAddComponent } from './department/department-add/department-add.component';
import { SharedModule } from '../../shared/shared.module';
import { DepartmentSearchComponent } from './department/department-search/department-search.component';
import { EmployeeSearchComponent } from './employee/employee-search/employee-search.component';
import { EmployeeAddComponent } from './employee/employee-add/employee-add.component';

@NgModule({
  declarations: [DepartmentIndexComponent, DepartmentAddComponent, DepartmentSearchComponent, EmployeeSearchComponent, EmployeeAddComponent],
  imports: [
    CommonModule,
    EmployeeManagerRoutingModule,
    SharedModule
  ]
})
export class EmployeeManagerModule { }
