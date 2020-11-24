import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { PositionService } from 'src/app/core/service/position.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { PositionAddComponent } from '../position-add/position-add.component';

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
    private positionService: PositionService,
    private modalService: NgbModal
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
    if (item && item > 0) {
      this.positionService.findOne(item).subscribe(res => {
        this.activeFormModal(this.modalService, PositionAddComponent, res.data);
      });
    } else {
      this.activeFormModal(this.modalService, PositionAddComponent, null);
    }
  }

}
