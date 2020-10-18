import { Component, OnInit } from '@angular/core';
import { Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';

@Component({
  selector: 'app-user-search',
  templateUrl: './user-search.component.html',
  styleUrls: ['./user-search.component.css']
})
export class UserSearchComponent extends BaseComponent implements OnInit {

  constructor(
    public actr: ActivatedRoute,
    public router: Router
  ) {
    super(actr);
    this.formSearch = this.buildForm({}, {
      userCode: ['', [Validators.maxLength(50)]],
      fullName: ['', [Validators.maxLength(200)]]
    });
   }

  ngOnInit(): void {
  }

  get f () {
    return this.formSearch.controls;
  }
}
