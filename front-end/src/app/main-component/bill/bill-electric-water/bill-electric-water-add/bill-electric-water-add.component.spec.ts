import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BillElectricWaterAddComponent } from './bill-electric-water-add.component';

describe('BillElectricWaterAddComponent', () => {
  let component: BillElectricWaterAddComponent;
  let fixture: ComponentFixture<BillElectricWaterAddComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BillElectricWaterAddComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BillElectricWaterAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
