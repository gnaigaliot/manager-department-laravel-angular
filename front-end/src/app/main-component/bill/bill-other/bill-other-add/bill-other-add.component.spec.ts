import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BillOtherAddComponent } from './bill-other-add.component';

describe('BillOtherAddComponent', () => {
  let component: BillOtherAddComponent;
  let fixture: ComponentFixture<BillOtherAddComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BillOtherAddComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BillOtherAddComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
