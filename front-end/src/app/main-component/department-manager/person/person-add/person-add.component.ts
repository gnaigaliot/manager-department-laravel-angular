import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from 'src/app/app.component';
import { PersonService } from 'src/app/core/service/person.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-person-add',
  templateUrl: './person-add.component.html',
  styleUrls: ['./person-add.component.css']
})
export class PersonAddComponent extends BaseComponent implements OnInit {
  private formConfig = {
    id: [''],
    code: ['', Validators.required],
    name: ['', Validators.required],
    gender: ['', Validators.required],
    address: ['', Validators.required],
    identityNumber: [''],
    dateOfBirth: ['', Validators.required],
    phoneNumber: [''],
    email: ['']
  };
  private idPerson: any;
  public formSave: FormGroup;
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private personService: PersonService,
    public activeModal: NgbActiveModal
  ) {
    super(null);
    this.setMainService(personService);
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
      this.personService.saveOrUpdate(this.formSave.value)
      .subscribe(res => {
        if (this.personService.requestIsSuccess(res)) {
          this.activeModal.close(res);
        }
      });
     }, () => {// on rejected
   });
  }

}
