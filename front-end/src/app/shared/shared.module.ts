import { NgModule } from '@angular/core';

import { MenuItems } from './menu-items/menu-items';
import { AccordionAnchorDirective, AccordionLinkDirective, AccordionDirective } from './accordion';
import { TreeTableModule } from 'primeng/treetable'
import { TableModule } from 'primeng/table'
import { ControlMessagesComponent } from './components/control-messages/control-messages.component';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MultiSelectModule } from 'primeng/multiselect';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';

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
    ReactiveFormsModule,
    MultiSelectModule,
    ConfirmDialogModule
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
    ReactiveFormsModule,
    MultiSelectModule,
    ConfirmDialogModule,
    FontAwesomeModule
   ],
  providers: [ MenuItems ]
})
export class SharedModule { }
