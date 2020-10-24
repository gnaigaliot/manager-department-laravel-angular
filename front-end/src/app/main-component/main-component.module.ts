import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MainComponentRoutingModule } from './main-component-routing.module';
import { SharedModule } from '../shared/shared.module';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { RequestResetComponent } from './request-reset/request-reset.component';

@NgModule({
  declarations: [LoginComponent, RegisterComponent, RequestResetComponent],
  imports: [
    CommonModule,
    MainComponentRoutingModule,
    SharedModule
  ]
})
export class MainComponentModule { }
