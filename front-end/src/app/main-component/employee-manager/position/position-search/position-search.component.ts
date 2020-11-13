import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { PositionService } from 'src/app/core/service/position.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';

@Component({
  selector: 'app-position-search',
  templateUrl: './position-search.component.html',
  styleUrls: ['./position-search.component.css']
})
export class PositionSearchComponent extends BaseComponent implements OnInit {

  formConfig = {
    name: ['', [Validators.maxLength(200)]],
    salary: ['', [Validators.maxLength(50)]]
  };

  constructor(
    public acrt: ActivatedRoute,
    public router: Router,
    private positionService: PositionService
  ) {
    super(acrt);
    this.setMainService(positionService);
    this.formSearch = this.buildForm({}, this.formConfig);
  }

  ngOnInit(): void {
    this.processSearch();
  }

  // tslint:disable-next-line: typedef
  public get f() {
    return this.formSearch.controls;
  }

  public prepareSaveOrUpdate(item?: any) {
    if (item == null) {
      this.router.navigateByUrl("employee-manager/positions/add");
    } else {
      this.router.navigate(["employee-manager/positions/edit", item]);
    }
  }

}
