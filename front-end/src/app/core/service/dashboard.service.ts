import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BasicService } from 'src/app/shared/service/basic.service';
import { HelperService } from 'src/app/shared/service/helper.service';

@Injectable({
  providedIn: 'root'
})
export class DashboardService extends BasicService {

  constructor(public httpClient: HttpClient, public helperService: HelperService) {
    super('dashboard', httpClient, helperService);
  }

  public getListEmployeeByYear(year: number): Observable<any> {
    const url = `${this.serviceUrl}/${year}`;
    return this.getRequest(url);
  }

  public getDashBoard(): Observable<any> {
    const url = `${this.serviceUrl}/dashboard`;
    return this.getRequest(url);
  }
}
