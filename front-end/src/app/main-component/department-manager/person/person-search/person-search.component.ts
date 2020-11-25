import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { DepartmentService } from 'src/app/core/service/department.service';
import { PersonService } from 'src/app/core/service/person.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';
import { PersonAddComponent } from '../person-add/person-add.component';

@Component({
  selector: 'app-person-search',
  templateUrl: './person-search.component.html',
  styleUrls: ['./person-search.component.css']
})
export class PersonSearchComponent extends BaseComponent implements OnInit {
  apartmentList: any = [];
  formconfig = {
    code: ['', [Validators.maxLength(50)]],
    name: ['', [Validators.maxLength(200)]],
    lstApartmentId: ['']
  };
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private personService: PersonService,
    private apartService: DepartmentService,
    private modalService: NgbModal
  ) {
    super(null);
    this.setMainService(personService);
    this.formSearch = this.buildForm({}, this.formconfig);
    this.apartService.getAllApartment().subscribe( res => {
      if (res.data) {
        for (const item of res.data) {
          this.apartmentList.push({label: item.name, value: item.id});
        }
      }
    });
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
      this.personService.findOne(item).subscribe(res => {
        this.activeFormModal(this.modalService, PersonAddComponent, res.data);
      });
    } else {
      this.activeFormModal(this.modalService, PersonAddComponent, null);
    }
  }

}
