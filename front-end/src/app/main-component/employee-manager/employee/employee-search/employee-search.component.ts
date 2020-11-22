import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { EmployeeService } from 'src/app/core/service/employee.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { EmployeeAddComponent } from '../employee-add/employee-add.component';

@Component({
  selector: 'app-employee-search',
  templateUrl: './employee-search.component.html',
  styleUrls: ['./employee-search.component.css']
})
export class EmployeeSearchComponent extends BaseComponent implements OnInit {

  formConfig = {
    code: ['', [Validators.maxLength(50)]],
    name: ['', [Validators.maxLength(50)]],
    gender: ['', [Validators.maxLength(50)]],
    email: ['', [Validators.maxLength(50)]],
    phoneNumber: ['', [Validators.maxLength(50)]],
    salary: ['', [Validators.maxLength(50)]],
    departmentName: ['', [Validators.maxLength(50)]],
    positionsName: ['', [Validators.maxLength(50)]]
  };

  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    public employeeService: EmployeeService,
    private modalService: NgbModal
  ) {
    super(actr);
    this.setMainService(employeeService);
    this.formSearch = this.buildForm({}, this.formConfig);
  }

  ngOnInit(): void {
    this.processSearch();
  }

  public get f() {
    return this.formSearch.controls;
  }

  public prepareSaveOrUpdate(item?: any) {
    if (item && item > 0) {
      this.employeeService.findOne(item).subscribe(res => {
        this.activeFormModal(this.modalService, EmployeeAddComponent, res.data);
      });
    } else {
      this.activeFormModal(this.modalService, EmployeeAddComponent, null);
    }
  }

}
