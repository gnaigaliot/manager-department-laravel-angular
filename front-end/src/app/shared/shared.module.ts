import { NgModule } from '@angular/core';

import { MenuItems } from './menu-items/menu-items';
import { AccordionAnchorDirective, AccordionLinkDirective, AccordionDirective } from './accordion';
import { TreeTableModule } from 'primeng/treetable'
import { TableModule } from 'primeng/table'

@NgModule({
  declarations: [
    AccordionAnchorDirective,
    AccordionLinkDirective,
    AccordionDirective
  ],
  exports: [
    AccordionAnchorDirective,
    AccordionLinkDirective,
    AccordionDirective,
    TreeTableModule,
    TableModule
   ],
  providers: [ MenuItems ]
})
export class SharedModule { }
