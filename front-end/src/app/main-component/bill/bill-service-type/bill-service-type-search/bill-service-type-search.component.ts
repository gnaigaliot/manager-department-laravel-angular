import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ACTION_FORM, RESOURCE } from 'src/app/core/app-config';
import { BillService } from 'src/app/core/service/bill.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';

@Component({
  selector: 'app-bill-service-type-search',
  templateUrl: './bill-service-type-search.component.html',
  styleUrls: ['./bill-service-type-search.component.css']
})
export class BillServiceTypeSearchComponent extends BaseComponent implements OnInit {
  formSearch: FormGroup;
  formconfig = {
    code: [''],
    name: ['']
  };
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    public billService: BillService
  ) {
    super(actr, RESOURCE.BILL, ACTION_FORM.SEARCH);
    this.setMainService(billService);
    this.formSearch = this.buildForm({}, this.formconfig);
  }

  ngOnInit(): void {
    this.processSearch();
  }

  // tslint:disable-next-line: typedef
  public get f() {
    return this.formSearch.controls;
  }
}
