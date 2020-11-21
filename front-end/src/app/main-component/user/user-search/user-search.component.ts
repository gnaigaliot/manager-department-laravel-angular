import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from 'src/app/app.component';
import { UserService } from 'src/app/core/service/user.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { UserFormComponent } from '../user-form/user-form.component';

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
    private userService: UserService,
    private modalService: NgbModal
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

  // tslint:disable-next-line: typedef
  get f() {
    return this.formSearch.controls;
  }

  prepareSaveOrUpdate(item?): void {
    if (item && item > 0) {
      this.userService.findOne(item).subscribe(res => {
        this.activeFormModal(this.modalService, UserFormComponent, res.data);
      });
    } else {
      this.activeFormModal(this.modalService, UserFormComponent, null);
    }
  }

  // tslint:disable-next-line: typedef
  public exportExcel() {
    import('xlsx').then(xlsx => {
        const worksheet = xlsx.utils.json_to_sheet(this.resultList.data);
        const workbook = { Sheets: { data: worksheet }, SheetNames: ['data'] };
        const excelBuffer: any = xlsx.write(workbook, { bookType: 'xlsx', type: 'array' });
        this.saveAsExcelFile(excelBuffer, 'user');
    });
  }

  saveAsExcelFile(buffer: any, fileName: string): void {
    import('file-saver').then(FileSaver => {
        const EXCEL_TYPE = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8';
        const EXCEL_EXTENSION = '.xlsx';
        const data: Blob = new Blob([buffer], {
            type: EXCEL_TYPE
        });
        FileSaver.saveAs(data, fileName + '_export_' + new Date().getTime() + EXCEL_EXTENSION);
    });
  }
}
