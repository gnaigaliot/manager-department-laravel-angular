import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/core/service/auth.service';
import { TokenService } from 'src/app/core/service/token.service';

const EMAIL_REGEX = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  registerForm: FormGroup;
  public error: [];

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
    return this.registerForm.controls;
  }
  
  private buildForm(): void {
    this.registerForm = this.formBuilder.group({
      email: ["", [Validators.required, Validators.pattern(EMAIL_REGEX)]],
      password: ["", [Validators.required, Validators.minLength(8)]],
      name: ["", Validators.required],
      dateOfBirth: ["", Validators.required],
      // gender: ["", Validators.required],
      // mobileNumber: [""],
      password_confirmation: ["", Validators.required]
    })
  }

  register() {
    if(this.registerForm.invalid) {
      return;
    }

    this.authService.signup(this.registerForm.value).subscribe(
      data => this.handleResponse(data),
      error => this.handleError(error)
    )
  }

  handleError(error) {
    this.error = error.error.errors;
  }

  handleResponse(data) {
    this.tokenSerivce.handle(data.access_token);
    this.authService.changeAuthStatus(true);
    // redirect
    const redirect = this.authService.redirectUrl ? this.authService.redirectUrl : 'dashboard';
    this.router.navigate([redirect]);
  }
}
