import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BillServiceTypeAddComponent } from './bill-service-type-add.component';

describe('BillServiceTypeAddComponent', () => {
  let component: BillServiceTypeAddComponent;
  let fixture: ComponentFixture<BillServiceTypeAddComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BillServiceTypeAddComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BillServiceTypeAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
