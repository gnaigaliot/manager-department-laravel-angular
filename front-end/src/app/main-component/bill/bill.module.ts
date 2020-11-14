import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BillRoutingModule } from './bill-routing.module';
import { BillElectricWaterSearchComponent } from './bill-electric-water/bill-electric-water-search/bill-electric-water-search.component';
import { BillElectricWaterAddComponent } from './bill-electric-water/bill-electric-water-add/bill-electric-water-add.component';
import { BillOtherSearchComponent } from './bill-other/bill-other-search/bill-other-search.component';
import { BillOtherAddComponent } from './bill-other/bill-other-add/bill-other-add.component';
import { BillServiceTypeSearchComponent } from './bill-service-type/bill-service-type-search/bill-service-type-search.component';
import { BillServiceTypeAddComponent } from './bill-service-type/bill-service-type-add/bill-service-type-add.component';
import { SharedModule } from 'src/app/shared/shared.module';


@NgModule({
  declarations: [
    BillElectricWaterSearchComponent,
    BillElectricWaterAddComponent,
    BillOtherSearchComponent,
    BillOtherAddComponent,
    BillServiceTypeSearchComponent,
    BillServiceTypeAddComponent
  ],
  imports: [
    CommonModule,
    BillRoutingModule,
    SharedModule
  ]
})
export class BillModule { }
