import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BasicService } from 'src/app/shared/service/basic.service';
import { HelperService } from 'src/app/shared/service/helper.service';

@Injectable({
  providedIn: 'root'
})
export class DepartmentService extends BasicService {

  constructor(public httpClient: HttpClient, public helperService: HelperService) {
    super('departments', httpClient, helperService);
  }

  public getAllApartment(data?: any): Observable<any> {
    const url = `${this.serviceUrl}/get-all-apartment`;
    return this.getRequest(url);
  }
}
