import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AppComponent } from 'src/app/app.component';
import { UserService } from 'src/app/core/service/user.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';

@Component({
  selector: 'app-user-search',
  templateUrl: './user-search.component.html',
  styleUrls: ['./user-search.component.css']
})
export class UserSearchComponent extends BaseComponent implements OnInit {

  sales: any[];

  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private userService: UserService
  ) {
    super(actr);
    this.setMainService(userService);
    this.formSearch = this.buildForm({}, {
      userCode: ['', [Validators.maxLength(50)]],
      fullName: ['', [Validators.maxLength(200)]]
    });
   }

  ngOnInit(): void {
    this.processSearch();
  }

  get f () {
    return this.formSearch.controls;
  }

  processSearch(event?): void {
    if (!CommonUtils.isValidForm(this.formSearch)) {
      return;
    }
    const params = this.formSearch ? this.formSearch.value : null;
    this.userService.getUserList(params, event).subscribe(res => {
      this.resultList = res;
      console.log("res", res);
    });
    if (!event) {
      if (this.dataTable) {
        this.dataTable.first = 0;
      }
    }
  }

  prepareSaveOrUpdate(item?): void {

  }
}
