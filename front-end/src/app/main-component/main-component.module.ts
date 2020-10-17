import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MainComponentRoutingModule } from './main-component-routing.module';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    MainComponentRoutingModule,
    SharedModule
  ]
})
export class MainComponentModule { }
