import { ChangeDetectorRef, Component, OnDestroy, OnInit } from '@angular/core';
import { MediaMatcher } from '@angular/cdk/layout';
import { MenuItems } from '../../../shared/menu-items/menu-items';
import { MenuItem } from "primeng/api"
@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: []
})
export class AppSidebarComponent implements OnDestroy, OnInit {
  mobileQuery: MediaQueryList;

  items: MenuItem[];
  private _mobileQueryListener: () => void;

  constructor(
    changeDetectorRef: ChangeDetectorRef,
    media: MediaMatcher,
    public menuItems: MenuItems
  ) {
    this.mobileQuery = media.matchMedia('(min-width: 768px)');
    this._mobileQueryListener = () => changeDetectorRef.detectChanges();
    this.mobileQuery.addListener(this._mobileQueryListener);
  }

  ngOnDestroy(): void {
    this.mobileQuery.removeListener(this._mobileQueryListener);
  }

  ngOnInit(): void {
    this.initMenu();
  }
  routerLink: ["/pagename"]
  private initMenu() {
    this.items = [
      {
        label: "Trang chủ",
        icon: "pi pi-home",
        routerLink: ["/dashboard"]
      },
      {
        label: "Quản lý user",
        icon: "pi pi-user",
        routerLink: ["/user"]
      },
      {
        label: "Quản lý nhân viên",
        icon: "pi pi-users",
        items: [
          {
            label: "Quản lý phòng ban",
            icon: "pi pi-th-large",
            routerLink: ["/employee-manager/departments"]
          },
          {
            label: "Quản lý nhân viên",
            icon: "pi pi-th-large",
            routerLink: ["/employee-manager/employees"]
          },
          {
            label: "Quản lý chức vụ",
            icon: "pi pi-th-large",
            routerLink: ["/employee-manager/positions"]
          }
        ]
      },
      {
        label: "Quản lý căn hộ",
        icon: "pi pi-inbox",
        items: [
          {
            label: "Căn hộ",
            routerLink: ["/department-manager/department"],
            icon: "pi pi-th-large"
          },
          {
            label: "Cư dân",
            routerLink: ["/department-manager/person"],
            icon: "pi pi-th-large"
          }
        ]
      },
      {
        label: "Quản lý hóa đơn",
        icon: "pi pi-money-bill",
 
        items: [
          {
            label: "Hóa đơn điện, nước",
            icon: "pi pi-th-large",
            routerLink: ["/bill/bill-water-electrict"]
          },
          {
            label: "Hóa đơn dịch vụ",
            icon: "pi pi-th-large",
            routerLink: ["/bill/bill-orther"]
          },
          {
            label: "Loại dịch vụ",
            icon: "pi pi-th-large",
            routerLink: ["/bill/bill-service-type"]
          }
        ]
      }
    ]
  }
}
