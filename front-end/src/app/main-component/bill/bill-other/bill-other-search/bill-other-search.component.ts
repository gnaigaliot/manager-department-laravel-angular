import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ACTION_FORM, RESOURCE } from 'src/app/core/app-config';
import { BillOtherService } from 'src/app/core/service/bill-other.service';
import { DepartmentService } from 'src/app/core/service/department.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';

@Component({
  selector: 'app-bill-other-search',
  templateUrl: './bill-other-search.component.html',
  styleUrls: ['./bill-other-search.component.css']
})
export class BillOtherSearchComponent extends BaseComponent implements OnInit {
  formSearch: FormGroup;
  formconfig = {
    code: [''],
    idApartment: ['']
  };
  public apartmentList: any = [];

  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    public billOtherService: BillOtherService,
    private departmentService: DepartmentService
  ) {
    super(actr, RESOURCE.BILL, ACTION_FORM.SEARCH);
    this.setMainService(billOtherService);
    this.formSearch = this.buildForm({}, this.formconfig);
  }

  ngOnInit(): void {
    this.processSearch();
    this.departmentService.getAllApartment().subscribe( res => {
      if (res.data) {
        for (const item of res.data) {
          this.apartmentList.push({label: item.name, value: item.id});
        }
      }
    });
  }

  // tslint:disable-next-line: typedef
  public get f() {
    return this.formSearch.controls;
  }

}
