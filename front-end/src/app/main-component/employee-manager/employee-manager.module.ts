import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeeManagerRoutingModule } from './employee-manager-routing.module';
import { DepartmentIndexComponent } from './department/department-index/department-index.component';
import { DepartmentAddComponent } from './department/department-add/department-add.component';
import { SharedModule } from '../../shared/shared.module';
import { DepartmentSearchComponent } from './department/department-search/department-search.component';

@NgModule({
  declarations: [DepartmentIndexComponent, DepartmentAddComponent, DepartmentSearchComponent],
  imports: [
    CommonModule,
    EmployeeManagerRoutingModule,
    SharedModule
  ]
})
export class EmployeeManagerModule { }
