import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DepartmentAddComponent } from './department/department-add/department-add.component';
import { DepartmentSearchComponent } from './department/department-search/department-search.component';
import { PersonSearchComponent } from './person/person-search/person-search.component';

const routes: Routes = [
  {
    path: 'department',
    component: DepartmentSearchComponent
  },
  {
    path: 'person',
    component: PersonSearchComponent
  },
  {
    path:'department/add',
    component: DepartmentAddComponent
  },
  {
    path:'department/edit/:id',
    component: DepartmentAddComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DepartmentManagerRoutingModule { }
