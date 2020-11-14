import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from 'src/app/app.component';
import { ACTION_FORM, RESOURCE } from 'src/app/core/app-config';
import { UserToken } from 'src/app/core/models/user-token.model';
import { UserService } from 'src/app/core/service/user.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html',
  styleUrls: ['./user-form.component.css']
})
export class UserFormComponent extends BaseComponent implements OnInit {
  formSave: FormGroup;
  userInfo: UserToken;
  positionList: any;
  formConfig = {
    userId: [''],
    userName: ['', [Validators.required, Validators.maxLength(100)]],
    password: ['', [Validators.required, Validators.maxLength(100)]],
    fullName: ['', [Validators.required, Validators.maxLength(200)]],
    dateOfBirth: ['', [Validators.required]],
    gender: ['', [Validators.required]],
    email: ['', [Validators.maxLength(50)]],
    mobileNumber: ['', [Validators.maxLength(50)]],
    userCode: ['', [Validators.required]],
    roleId: [''],
    lstRoleId: ['']
  };

  constructor(
    public actr: ActivatedRoute,
    public activeModal: NgbActiveModal,
    private formBuilder: FormBuilder,
    public userService: UserService,
    private app: AppComponent
  ) {
    super(actr, RESOURCE.USER, ACTION_FORM.SEARCH);
    // this.userService.getRoles().subscribe(res => {
    //   this.initListRole(res);
    // });
    this.formSave = this.buildForm({}, this.formConfig);
  }

  ngOnInit(): void {
  }

  get f () {
    return this.formSave.controls;
  }

  public setFormValue(propertyConfigs: any, data?: any) {
    this.propertyConfigs = propertyConfigs;
    if (data && data.userId > 0) {
      this.formSave = this.buildForm(data, this.formConfig);
    }
  }

  processSaveOrUpdate() {
    if (!CommonUtils.isValidForm(this.formSave)) {
      return;
    }
    this.app.confirmMessage(null, () => {// on accepted
      this.userService.saveOrUpdate(this.formSave.value)
      .subscribe(res => {
        if (this.userService.requestIsSuccess(res)) {
          this.activeModal.close(res);
        }
      });
     }, () => {// on rejected
   });
  }

  initListRole(data) {
    this.positionList = [];
    if (data) {
      for (const item of data) {
        this.positionList.push({label: item.roleName, value: item.roleId});
      }
    } 
  }

}
