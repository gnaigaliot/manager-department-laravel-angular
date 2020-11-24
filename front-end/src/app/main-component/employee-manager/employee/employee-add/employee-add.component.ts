import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from 'src/app/app.component';
import { DepartmentService } from 'src/app/core/service/department.service';
import { EmployeeService } from 'src/app/core/service/employee.service';
import { PhongBanService } from 'src/app/core/service/phong-ban.service';
import { PositionService } from 'src/app/core/service/position.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-employee-add',
  templateUrl: './employee-add.component.html',
  styleUrls: ['./employee-add.component.css']
})
export class EmployeeAddComponent extends BaseComponent implements OnInit {

  private formConfig = {
    id: [''],
    code: [''],
    name: ['', [Validators.required]],
    dateOfBird: ['', [Validators.required]],
    gender: [1, [Validators.required]],
    email: ['', [Validators.required, Validators.email, Validators.maxLength(100)]],
    phonenumber: ['', [Validators.required]],
    // For workprocess
    idDepartment: ['', [Validators.required]],
    idPositions: ['', [Validators.required]],
    startDate: ['', [Validators.required]],
    endDate: ['', [Validators.required]]
  };
  public listDepartment: any = [];
  public listPositions: any = [];
  public idEmployee: any;
  public formSave: FormGroup;
  
  constructor(
    public activateRoute: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private employeeService: EmployeeService,
    private phongBanService: PhongBanService,
    private positionService: PositionService,
    public activeModal: NgbActiveModal
  ) {
    super(null);
    this.setMainService(employeeService);
    // lay list phong ban
    this.phongBanService.getAllDepartment().subscribe(data => {
      if (data) {
        for (const item of data.data) {
          this.listDepartment.push({label: item.name, value: item.id});
        }
      }
    });
    // list chuc vu
    this.positionService.getAllPosition().subscribe(data => {
      if (data) {
        for (const item of data.data) {
          this.listPositions.push({label: item.name, value: item.id});
        }
      }
    });
    this.formSave = this.buildForm({}, this.formConfig);
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
      this.employeeService.saveOrUpdate(this.formSave.value)
      .subscribe(res => {
        if (this.employeeService.requestIsSuccess(res)) {
          this.activeModal.close(res);
        }
      });
     }, () => {// on rejected
   });
  }
}
