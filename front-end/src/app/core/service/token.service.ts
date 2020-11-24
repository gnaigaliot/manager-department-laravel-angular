import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class TokenService {
  private iss = {
    login: 'http://localhost:8000/api/login',
    signup: 'http://localhost:8000/api/signup'
  };

  constructor() { }
  
  handle(token) {
    this.set(token);
  }

  setListRole(lstRole) {
    localStorage.setItem('listRoleUser', lstRole);
  }

  setUserLoginName(userLoginName) {
    localStorage.setItem('userLoginName', userLoginName);
  }

  public static getListRole() {
    return localStorage.getItem('listRoleUser');
  }

  public static getUserLoginName() {
    return localStorage.getItem('userLoginName');
  }

  set(token) {
    localStorage.setItem('token', token);
  }
  get() {
    return localStorage.getItem('token');
  }

  remove() {
    localStorage.removeItem('token');
    localStorage.removeItem('listRoleUser');
    localStorage.removeItem('userLoginName');
  }

  isValid() {
    const token = this.get();
    if (token) {
      const payload = this.payload(token);
      if (payload) {
        return Object.values(this.iss).indexOf(payload.iss) > -1 ? true : false;
      }
    }
    return false;
  }

  payload(token) {
    const payload = token.split('.')[1];
    return this.decode(payload);
  }

  decode(payload) {
    return JSON.parse(atob(payload));
  }

  loggedIn() {
    return this.isValid();
  }
}
