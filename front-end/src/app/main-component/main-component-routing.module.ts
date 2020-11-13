import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: 'user',
    loadChildren: () => import('./user/user.module').then(m => m.UserModule)
  },
  {
    path: 'employee-manager',
    loadChildren: () => import('./employee-manager/employee-manager.module').then(m => m.EmployeeManagerModule)
  },
  {
    path: 'department-manager',
    loadChildren: () => import('./department-manager/department-manager.module').then(m => m.DepartmentManagerModule)
  },
  {
    path: 'bill',
    loadChildren: () => import('./bill/bill.module').then(m => m.BillModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MainComponentRoutingModule { }
