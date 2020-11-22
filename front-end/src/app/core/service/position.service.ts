import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BasicService } from 'src/app/shared/service/basic.service';
import { HelperService } from 'src/app/shared/service/helper.service';

@Injectable({
  providedIn: 'root'
})
export class PositionService extends BasicService {

  constructor(public httpClient: HttpClient, public helperService: HelperService) {
    super('positions', httpClient, helperService);
  }

  public getAllPosition(): Observable<any> {
    const url = `${this.serviceUrl}/get-all-position`;
    return this.getRequest(url);
  }
}
