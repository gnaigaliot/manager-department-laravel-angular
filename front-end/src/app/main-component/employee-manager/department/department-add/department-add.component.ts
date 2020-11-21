import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from 'src/app/app.component';
import { PhongBanService } from 'src/app/core/service/phong-ban.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-department-add',
  templateUrl: './department-add.component.html',
  styleUrls: ['./department-add.component.css']
})
export class DepartmentAddComponent extends BaseComponent implements OnInit {
  public idDepartment: any;
  public formSave: FormGroup;
  private formConfig = {
    id: [''],
    code: ['', [Validators.required]],
    name: ['', [Validators.required]]
  };
  constructor(
    public activateRoute: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private phongBanService: PhongBanService,
    public activeModal: NgbActiveModal
  ) {
    super(null);
    this.setMainService(phongBanService);
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
      this.phongBanService.saveOrUpdate(this.formSave.value)
      .subscribe(res => {
        if (this.phongBanService.requestIsSuccess(res)) {
          this.activeModal.close(res);
        }
      });
     }, () => {// on rejected
   });
  }
}
