import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { TokenService } from './token.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  redirectUrl = 'dashboard';
  isUserLoggedIn = new BehaviorSubject<boolean>(this.tokenSerivce.loggedIn());
  authStatus = this.isUserLoggedIn.asObservable();

  constructor(
    private httpClient: HttpClient,
    private tokenSerivce: TokenService
  ) { }

  changeAuthStatus(value: boolean) {
    this.isUserLoggedIn.next(value);
  }

  login(data: any): Observable<any> {
    const url = `${environment.API_URL}/login`;
    return this.httpClient.post(url, data);
  }

  signup(data: any): Observable<any> {
    const url = `${environment.API_URL}/signup`;
    return this.httpClient.post(url, data);
  }
}
