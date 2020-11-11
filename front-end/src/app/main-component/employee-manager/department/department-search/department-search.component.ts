import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AppComponent } from 'src/app/app.component';
import { PhongBanService } from 'src/app/core/service/phong-ban.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-department-search',
  templateUrl: './department-search.component.html',
  styleUrls: ['./department-search.component.css']
})
export class DepartmentSearchComponent extends BaseComponent implements OnInit {

  formConfig = {
    code: ['', [Validators.maxLength(50)]],
    name: ['', [Validators.maxLength(50)]],
    createdBy: ['', [Validators.maxLength(50)]],
    editedBy: ['', [Validators.maxLength(50)]]
  };

  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private phongBanService: PhongBanService
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

  // processSearch(event?): void {
  //   if (!CommonUtils.isValidForm(this.formSearch)) {
  //     return;
  //   }
  //   const params = this.formSearch ? this.formSearch.value : null;
  //   // this.phongBanService.getUserList(params, event).subscribe(res => {
  //   //   this.resultList = res;
  //   // });
  //   if (!event) {
  //     if (this.dataTable) {
  //       this.dataTable.first = 0;
  //     }
  //   }
  // }
}
