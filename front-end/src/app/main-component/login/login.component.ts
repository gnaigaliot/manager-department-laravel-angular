import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/core/service/auth.service';
import { TokenService } from 'src/app/core/service/token.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  error: '';

  constructor(
    public router: Router,
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private tokenSerivce: TokenService
  ) { }

  ngOnInit(): void {
    this.buildForm();
  }

  get f() {
    return this.loginForm.controls;
  }

  private buildForm(): void {
    this.loginForm = this.formBuilder.group({
      email: ["", Validators.required],
      password: ["", Validators.required]
    })
  }

  login() {
    if(this.loginForm.invalid) {
      return;
    }

    this.authService.login(this.loginForm.value).subscribe(
      data => this.handleResponse(data),
      error => this.handleError(error)
    )
  }

  handleError(error) {
    this.error = error.error.error;
  }

  handleResponse(data) {
    this.tokenSerivce.handle(data.access_token);
    this.authService.changeAuthStatus(true);
    const redirect = this.authService.redirectUrl ? this.authService.redirectUrl : 'dashboard';
    this.router.navigate([redirect]);
  }
}
