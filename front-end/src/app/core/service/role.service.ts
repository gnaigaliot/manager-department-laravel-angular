import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BasicService } from 'src/app/shared/service/basic.service';
import { HelperService } from 'src/app/shared/service/helper.service';

@Injectable({
  providedIn: 'root'
})
export class RoleService extends BasicService {

  constructor(public httpClient: HttpClient, public helperService: HelperService) {
    super('role', httpClient, helperService);
  }

  public getRoles(): Observable<any> {
    const url = `${this.serviceUrl}/get-roles`;
    return this.getRequest(url);
  }
}
