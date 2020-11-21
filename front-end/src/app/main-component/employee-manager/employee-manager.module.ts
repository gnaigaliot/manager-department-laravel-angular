import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeeManagerRoutingModule } from './employee-manager-routing.module';
import { DepartmentIndexComponent } from './department/department-index/department-index.component';
import { DepartmentAddComponent } from './department/department-add/department-add.component';
import { SharedModule } from '../../shared/shared.module';
import { DepartmentSearchComponent } from './department/department-search/department-search.component';
import { EmployeeSearchComponent } from './employee/employee-search/employee-search.component';
import { EmployeeAddComponent } from './employee/employee-add/employee-add.component';
import { PositionSearchComponent } from './position/position-search/position-search.component';
import { PositionAddComponent } from './position/position-add/position-add.component';
import { DepartmentEmployeesComponent } from './department/department-employees/department-employees.component';

@NgModule({
  declarations: [
    DepartmentIndexComponent,
    DepartmentAddComponent,
    DepartmentSearchComponent,
    EmployeeSearchComponent,
    EmployeeAddComponent,
    PositionSearchComponent,
    PositionAddComponent,
    DepartmentEmployeesComponent
  ],
  imports: [
    CommonModule,
    EmployeeManagerRoutingModule,
    SharedModule
  ]
})
export class EmployeeManagerModule { }
