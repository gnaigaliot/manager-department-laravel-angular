import { Component, OnInit } from '@angular/core';
import { FormArray, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from 'src/app/app.component';
import { DepartmentService } from 'src/app/core/service/department.service';
import { PersonService } from 'src/app/core/service/person.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-department-add',
  templateUrl: './department-add.component.html',
  styleUrls: ['./department-add.component.css']
})
export class DepartmentAddComponent extends BaseComponent implements OnInit {
  
  formConfig = {
    id: [''],
    code: ['', Validators.required],
    name: ['', Validators.required],
    price: ['', [Validators.required, Validators.min(0)]],
    area: ['', Validators.required],
    description: ['']
  }
  // auto complete
  results: any;
  results1: String;
  // auto complete
  formPersonConfig = {
    id: [''],
    name: [''],
    idPerson: ['', Validators.required],
    code: [''],
    address: [''],
    dateOfBirth: [''],
    phoneNumber: [''],
    isMain: [''],
  }
  public idDepartment: any;
  public formSave : FormGroup;
  public formPerson: FormArray;
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    public deparmentService: DepartmentService,
    public personService: PersonService,
  ) {
    super (null);
    this.setMainService(deparmentService);
    // set value
    this.actr.params.subscribe(params => {
      if (params && params.id != null) {
        this.idDepartment = params.id;
        this.setFormValue(this.idDepartment);
      } else {
        this.buildFormPerson();
        this.formSave = this.buildForm({}, this.formConfig);
      }
    });
  }

  ngOnInit(): void {
  }

  // tslint:disable-next-line: typedef
  private setFormValue(id) {
    this.deparmentService.findOne(id).subscribe(res => {
      this.buildFormPerson(res.data.lstPersonIn);
      this.formSave = this.buildForm(res.data.apartmentForm, this.formConfig);
      this.f.code.setValue(res.data.apartmentForm.code);
    }
  )
}

  get f () {
    return this.formSave.controls;
  }

  private makeDefaultPersonForm(): FormGroup {
    const formGroup = this.buildForm({}, this.formPersonConfig);
    return formGroup;
  }

  /**
   * 
   * @param listEmp 
   */
  private buildFormPerson(listEmp?: any) {
    let controls = new FormArray([]);
    
    if(listEmp && listEmp.length > 0) {
      for (const emp of listEmp) {
        const group = this.makeDefaultPersonForm();
        group.patchValue(emp);
        controls.push(group);
      }
    } else {
      const group = this.makeDefaultPersonForm();
      controls.push(group);
    }
    this.formPerson = controls;
  }

  /**
   * addEmp
   * param index
   * param item
   */
  public addPerson(index: number, item: FormGroup) {
    const controls = this.formPerson as FormArray;
    controls.insert(index + 1, this.makeDefaultPersonForm());
  }

  /**
   * removeEmp
   * param index
   * param item
   */
  public removePerson(index: number, item: FormGroup) {
    const controls = this.formPerson as FormArray;
    if (controls.length === 1) {
      this.buildFormPerson(null);
    }
    controls.removeAt(index);
  }

  private searchAutoComplete(event) {
    this.personService.findByCodeOrName(event.query).subscribe(res => {
        this.results = res.data;
    });
  }

  setInfoPerson(item, data) {
    item.controls.idPerson.setValue(data.id);
    item.controls.code.setValue(data.code);
    item.controls.dateOfBirth.setValue(data.dateOfBirth);
    item.controls.address.setValue(data.address);
    item.controls.phoneNumber.setValue(data.phoneNumber);
  }

  public back() {
    this.router.navigate(['/department-manager/department']);
  }

  public saveOrUpdate() {
    let isSave = true;
    if(!CommonUtils.isValidForm(this.formSave)) {
      isSave = false;
    } 
    if(this.formPerson != null && this.formPerson.length > 1 && !CommonUtils.isValidForm(this.formPerson)) {
      isSave = false;
    }
    if (isSave) {
    const formInput = {};
    formInput['apartmentForm'] = this.formSave.value;
    formInput['lstApartmentForm'] = this.formPerson.value;
    this.app.confirmMessage(null, () => {// on accepted
      this.deparmentService.saveOrUpdate(formInput)
        .subscribe(res => {
          if (this.deparmentService.requestIsSuccess(res)) {
            this.back();
          } 
        });
    }, () => {
      // on rejected
    });
  }
  }
}
