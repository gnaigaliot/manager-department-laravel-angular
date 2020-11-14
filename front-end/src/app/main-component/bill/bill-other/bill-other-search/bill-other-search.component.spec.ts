import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BillOtherSearchComponent } from './bill-other-search.component';

describe('BillOtherSearchComponent', () => {
  let component: BillOtherSearchComponent;
  let fixture: ComponentFixture<BillOtherSearchComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BillOtherSearchComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BillOtherSearchComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
