import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from 'src/app/app.component';
import { BillWaterElectrictService } from 'src/app/core/service/bill-water-electrict.service';
import { DepartmentService } from 'src/app/core/service/department.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-bill-electric-water-add',
  templateUrl: './bill-electric-water-add.component.html',
  styleUrls: ['./bill-electric-water-add.component.css']
})
export class BillElectricWaterAddComponent extends BaseComponent implements OnInit {

  formConfig = {
    id: [''],
    codeBill: [''],
    oldNumber: ['',[Validators.required, Validators.maxLength(5), Validators.min(1), Validators.max(99999)]],
    newNumber: ['',[Validators.required, Validators.maxLength(5),Validators.min(1), Validators.max(99999)]],
    fromDate: ['',[Validators.required]],
    toDate: ['',[Validators.required]],
    idApartment: ['',[Validators.required, Validators.maxLength(10)]],
    type: ['',[Validators.required, Validators.maxLength(10)]],
    amount: [''],
    totalPrice: [''],
    unitElectrict: [''],
    unitWater: ['']
  }
  public unitWater: any;
  public unitElectrict: any;
  private id: any;
  public apartmentList: any = [];
  public formSave : FormGroup;

  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private billWaterService: BillWaterElectrictService,
    private departmentService: DepartmentService,
    public activeModal: NgbActiveModal
  ) {
    super (null);
    this.setMainService(billWaterService);
    this.formSave = this.buildForm({}, this.formConfig);
    this.departmentService.getAllApartment().subscribe( res => {
      if (res.data) {
        for (const item of res.data) {
          this.apartmentList.push({label: item.name, value: item.id});
        }
      }
    });
  }

  ngOnInit(): void {
  }
  
  // tslint:disable-next-line: typedef
  get f() {
    return this.formSave.controls;
  }

  // tslint:disable-next-line: typedef
  public setFormValue(propertyConfigs: any, data?: any) {
    this.propertyConfigs = propertyConfigs;
    if (data && data.id > 0) {
      this.formSave = this.buildForm(data, this.formConfig);
    }
  }

  // tslint:disable-next-line: typedef
  processSaveOrUpdate() {
    if (!CommonUtils.isValidForm(this.formSave)) {
      return;
    }
    this.app.confirmMessage(null, () => {// on accepted
      this.billWaterService.saveOrUpdate(this.formSave.value)
      .subscribe(res => {
        if (this.billWaterService.requestIsSuccess(res)) {
          this.activeModal.close(res);
        }
      });
    }, () => {// on rejected
  });
  }
}
