import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/core/service/auth.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: []
})
export class AppHeaderComponent implements OnInit {

  public loggedIn: boolean;

  constructor(private authService: AuthService) {
    
  }

  ngOnInit() {
    this.authService.authStatus.subscribe(value => this.loggedIn = value);
  }
}
