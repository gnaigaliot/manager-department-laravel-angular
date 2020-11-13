import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DepartmentManagerRoutingModule } from './department-manager-routing.module';
import { SharedModule } from 'src/app/shared/shared.module';
import { DepartmentSearchComponent } from './department/department-search/department-search.component';
import { DepartmentAddComponent } from './department/department-add/department-add.component';
import { PersonSearchComponent } from './person/person-search/person-search.component';
import { PersonAddComponent } from './person/person-add/person-add.component';


@NgModule({
  declarations: [
    DepartmentSearchComponent,
    DepartmentAddComponent,
    PersonSearchComponent,
    PersonAddComponent
  ],
  imports: [
    CommonModule,
    DepartmentManagerRoutingModule,
    SharedModule
  ]
})
export class DepartmentManagerModule { }
