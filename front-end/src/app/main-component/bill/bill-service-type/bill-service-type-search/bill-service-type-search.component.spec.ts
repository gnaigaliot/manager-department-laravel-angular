import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BillServiceTypeSearchComponent } from './bill-service-type-search.component';

describe('BillServiceTypeSearchComponent', () => {
  let component: BillServiceTypeSearchComponent;
  let fixture: ComponentFixture<BillServiceTypeSearchComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BillServiceTypeSearchComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BillServiceTypeSearchComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
