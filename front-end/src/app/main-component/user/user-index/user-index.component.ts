import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AppComponent } from 'src/app/app.component';
import { UserService } from 'src/app/core/service/user.service';
import { BaseComponent } from 'src/app/shared/components/base-component/base-component.component';

@Component({
  selector: 'app-user-index',
  templateUrl: './user-index.component.html',
  styleUrls: ['./user-index.component.css']
})
export class UserIndexComponent extends BaseComponent implements OnInit {

  constructor(
    public actr: ActivatedRoute,
    public router: Router,
    private app: AppComponent,
    private userService: UserService
  ) {
    super(actr);
  }

  ngOnInit(): void {
  }

}
