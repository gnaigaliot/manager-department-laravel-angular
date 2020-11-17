import { TestBed } from '@angular/core/testing';

import { BillOtherService } from './bill-other.service';

describe('BillOtherService', () => {
  let service: BillOtherService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(BillOtherService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
