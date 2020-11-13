import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BillElectricWaterSearchComponent } from './bill-electric-water-search.component';

describe('BillElectricWaterSearchComponent', () => {
  let component: BillElectricWaterSearchComponent;
  let fixture: ComponentFixture<BillElectricWaterSearchComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BillElectricWaterSearchComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BillElectricWaterSearchComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
