import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AppComponent } from 'src/app/app.component';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';

@Component({
  selector: 'app-department-index',
  templateUrl: './department-index.component.html',
  styleUrls: ['./department-index.component.css']
})
export class DepartmentIndexComponent extends BaseComponent implements OnInit {

  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
  ) {
    super(actr);
  }

  ngOnInit(): void {
  }

}
