import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { BillElectricWaterSearchComponent } from './bill-electric-water/bill-electric-water-search/bill-electric-water-search.component';
import { BillOtherSearchComponent } from './bill-other/bill-other-search/bill-other-search.component';
import { BillServiceTypeSearchComponent } from './bill-service-type/bill-service-type-search/bill-service-type-search.component';

const routes: Routes = [
  {
    path: 'bill-water-electric',
    component: BillElectricWaterSearchComponent
  },
  {
    path: 'bill-other',
    component: BillOtherSearchComponent
  },
  {
    path: 'bill-service-type',
    component: BillServiceTypeSearchComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BillRoutingModule { }
