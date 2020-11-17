import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { DepartmentService } from 'src/app/core/service/department.service';
import { PersonService } from 'src/app/core/service/person.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';

@Component({
  selector: 'app-person-search',
  templateUrl: './person-search.component.html',
  styleUrls: ['./person-search.component.css']
})
export class PersonSearchComponent extends BaseComponent implements OnInit {
  apartmentList: any;
  formconfig = {
    code: ['', [Validators.maxLength(50)]],
    name: ['', [Validators.maxLength(200)]],
    lstApartmentId:['']
  }
  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private personService: PersonService,
    private apartService: DepartmentService,
  ) {
    super(null);
    this.setMainService(personService);
    this.formSearch = this.buildForm({}, this.formconfig);
    this.apartService.getAllApartment().subscribe( res => {
      this.apartmentList = res.data;
      console.log(this.apartmentList);
    }
    );
  }

  ngOnInit(): void {
    this.processSearch();
  }

  public get f () {
    return this.formSearch.controls;
  }

}
