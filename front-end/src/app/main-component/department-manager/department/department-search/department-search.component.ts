import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { DepartmentService } from 'src/app/core/service/department.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';

@Component({
  selector: 'app-department-search',
  templateUrl: './department-search.component.html',
  styleUrls: ['./department-search.component.css']
})
export class DepartmentSearchComponent extends BaseComponent implements OnInit {

  formconfig = {
    code: ['', [Validators.maxLength(50)]],
    name: ['', [Validators.maxLength(200)]],
    haveLive: [''],
    notHaveLive: ['']
  }
  
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private departmentService: DepartmentService,
  ) {
    super(actr);
    this.setMainService(departmentService);
    this.formSearch = this.buildForm({}, this.formconfig);
    this.f.haveLive.setValue(0);
    this.f.notHaveLive.setValue(0);
  }

  ngOnInit(): void {
    this.processSearch();
  }

  public get f () {
    return this.formSearch.controls;
  }

}
