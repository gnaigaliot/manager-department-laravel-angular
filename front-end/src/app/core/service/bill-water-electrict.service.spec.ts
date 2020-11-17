import { TestBed } from '@angular/core/testing';

import { BillWaterElectrictService } from './bill-water-electrict.service';

describe('BillWaterElectrictService', () => {
  let service: BillWaterElectrictService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(BillWaterElectrictService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
