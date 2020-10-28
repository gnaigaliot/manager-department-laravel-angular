import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/core/service/auth.service';
import { TokenService } from 'src/app/core/service/token.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: []
})
export class AppHeaderComponent implements OnInit {

  public loggedIn: boolean;

  constructor(
    private authService: AuthService,
    public router: Router,
    private tokenSerivce: TokenService
    ) {
    
  }

  ngOnInit() {
    this.authService.authStatus.subscribe(value => this.loggedIn = value);
  }

  logout(event: MouseEvent) {
    event.preventDefault();
    this.tokenSerivce.remove();
    this.authService.changeAuthStatus(false);
    this.router.navigateByUrl('/login');
  }
}
