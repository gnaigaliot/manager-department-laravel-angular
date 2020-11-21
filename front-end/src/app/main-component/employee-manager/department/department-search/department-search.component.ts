import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from 'src/app/app.component';
import { PhongBanService } from 'src/app/core/service/phong-ban.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { DepartmentAddComponent } from '../department-add/department-add.component';

@Component({
  selector: 'app-department-search',
  templateUrl: './department-search.component.html',
  styleUrls: ['./department-search.component.css']
})
export class DepartmentSearchComponent extends BaseComponent implements OnInit {

  formConfig = {
    code: ['', [Validators.maxLength(50)]],
    name: ['', [Validators.maxLength(50)]]
  };

  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private phongBanService: PhongBanService,
    private modalService: NgbModal
  ) {
    super(actr);
    this.setMainService(phongBanService);
    this.formSearch = this.buildForm({}, this.formConfig);
  }

  ngOnInit(): void {
    this.processSearch();
  }

  // tslint:disable-next-line: typedef
  public get f() {
    return this.formSearch.controls;
  }

  prepareSaveOrUpdate(item?): void {
    if (item && item > 0) {
      this.phongBanService.findOne(item).subscribe(res => {
        this.activeFormModal(this.modalService, DepartmentAddComponent, res.data);
      });
    } else {
      this.activeFormModal(this.modalService, DepartmentAddComponent, null);
    }
  }

  public goToListEmployeeOfDepartment(idDepartment: number) {
    this.router.navigateByUrl(`employee-manager/departments/${idDepartment}/employees`);
  }
}
