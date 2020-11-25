import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ACTION_FORM, RESOURCE } from 'src/app/core/app-config';
import { BillWaterElectrictService } from 'src/app/core/service/bill-water-electrict.service';
import { DepartmentService } from 'src/app/core/service/department.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { BillElectricWaterAddComponent } from '../bill-electric-water-add/bill-electric-water-add.component';

@Component({
  selector: 'app-bill-electric-water-search',
  templateUrl: './bill-electric-water-search.component.html',
  styleUrls: ['./bill-electric-water-search.component.css']
})
export class BillElectricWaterSearchComponent extends BaseComponent implements OnInit {
  formSearch: FormGroup;
  formconfig = {
    type: [''],
    codeBill: [''],
    idApartment: ['']
  };
  public apartmentList: any = [];
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    public billWaterElectrictService: BillWaterElectrictService,
    private departmentService: DepartmentService,
    private modalService: NgbModal
  ) {
    super(actr, RESOURCE.BILL, ACTION_FORM.SEARCH);
    this.setMainService(billWaterElectrictService);
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

  prepareSaveOrUpdate(item?): void {
    if (item && item > 0) {
      this.billWaterElectrictService.findOne(item).subscribe(res => {
        this.activeFormModal(this.modalService, BillElectricWaterAddComponent, res.data);
      });
    } else {
      this.activeFormModal(this.modalService, BillElectricWaterAddComponent, null);
    }
  }

}
