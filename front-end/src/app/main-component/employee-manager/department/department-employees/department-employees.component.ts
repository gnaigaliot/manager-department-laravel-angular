import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AppComponent } from 'src/app/app.component';
import { PhongBanService } from 'src/app/core/service/phong-ban.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';

@Component({
  selector: 'app-department-employees',
  templateUrl: './department-employees.component.html',
  styleUrls: ['./department-employees.component.css']
})
export class DepartmentEmployeesComponent extends BaseComponent implements OnInit {
  formConfig = {
    code: ['', [Validators.maxLength(50)]],
    name: ['', [Validators.maxLength(50)]],
    email: ['', [Validators.maxLength(50)]],
    positionsName: ['', [Validators.maxLength(50)]]
  };
  public idDepartment: any;
  public formSave: FormGroup;
  public departmentInfo: any;
  constructor(
    public activateRoute: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    public phongBanService: PhongBanService
  ) {
    super(null);
    this.setMainService(phongBanService);
    this.formSearch = this.buildForm({}, this.formConfig);
    this.departmentInfo = {
      code: '',
      name: '',
      createdDate: '',
      createdBy: ''
    };
  }

  ngOnInit(): void {
    this.activateRoute.params.subscribe(params => {
      if (params && params.id != null) {
        this.idDepartment = params.id;
      }
    });
    this.processSearch();
    this.phongBanService.findOne(this.idDepartment).subscribe(result => {
      this.departmentInfo = result.data;
    });
  }

  public get f() {
    return this.formSearch.controls;
  }

  public setFormValue(id: number) {
    this.phongBanService.findOne(id).subscribe(response => {
      this.formSave = this.buildForm(response.data, this.formConfig);
    });
  }

  processBack() {
    this.router.navigateByUrl(`employee-manager/departments`);
  }
}
