import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BasicService } from 'src/app/shared/service/basic.service';
import { CommonUtils } from 'src/app/shared/service/common-utils.service';
import { HelperService } from 'src/app/shared/service/helper.service';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class UserService extends BasicService {

  constructor(public httpClient: HttpClient, public helperService: HelperService) {
    super(httpClient, helperService);
   }

  public getUserList(data?: any, event?: any): Observable<any> {
    if (!event) {
      this.credentials = Object.assign({}, data);
    }

    const searchData = CommonUtils.convertData(this.credentials);
    if (event) {
      searchData._search = event;
    }
    const buildParams = CommonUtils.buildParams(searchData);
    const url = `${environment.API_URL}/search-user`;
    console.log("url", url);
    return this.getRequest(url, {params: buildParams});
  }
}
