import { NgModule } from '@angular/core';

import { MenuItems } from './menu-items/menu-items';
import { AccordionAnchorDirective, AccordionLinkDirective, AccordionDirective } from './accordion';
import { TreeTableModule } from 'primeng/treetable'
import { TableModule } from 'primeng/table'
import { ControlMessagesComponent } from './components/control-messages/control-messages.component';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AccordionAnchorDirective,
    AccordionLinkDirective,
    AccordionDirective,
    ControlMessagesComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule
  ],
  exports: [
    AccordionAnchorDirective,
    AccordionLinkDirective,
    AccordionDirective,
    TreeTableModule,
    TableModule,
    ControlMessagesComponent,
    CommonModule,
    FormsModule,
    ReactiveFormsModule
   ],
  providers: [ MenuItems ]
})
export class SharedModule { }
