import { Component, AfterViewInit, OnInit, ViewChild } from '@angular/core';
import { UIChart } from 'primeng/chart';
import { DashboardService } from '../core/service/dashboard.service';
import { BaseComponent } from '../shared/components/base-component/base-component.component';

@Component({
	selector: 'app-dashboard',
	templateUrl: './dashboard.component.html',
	styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent extends BaseComponent implements AfterViewInit, OnInit {
	empty : any;
	active : any;
	totalPerson : any;
	listYear : any = [];
	year : any;
	yearPerson : any;
	data: any;
	@ViewChild("chart") chart: UIChart; 
	@ViewChild("chartBill") chartBill: UIChart; 
	
	constructor(
		private dashboardService: DashboardService
	) {
		super(null);
		var year = new Date().getFullYear();
		this.formSearch = this.buildForm({},{
			yearPerson: [year]
		});
		this.changeYearPerson();
		this.dashboardService.getDashBoard().subscribe(res => {
			this.totalPerson = res.data.totalPerson;
			this.empty = res.data.empty;
        	this.active = res.data.active;
		});
	}

	public get f() {
		return this.formSearch.controls;
	}

	ngAfterViewInit() { }

	ngOnInit() {
		var year = new Date().getFullYear();
		this.year = year;
		this.yearPerson = year;
		for (let index = year; index > year-11; index--) {
			var item ={
			  label: index,
			  value: index
			};
			this.listYear.push(item);
		}
	}

	public changeYearPerson(){
		const yearEmp = this.formSearch.controls['yearPerson'].value;
		this.yearPerson = yearEmp;
		this.dashboardService.getListEmployeeByYear(yearEmp).subscribe(res => {
			this.data = {
				labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
				datasets: [
					{
						label: 'Tổng số cư dân',
						backgroundColor: '#42A5F5',
						borderColor: '#1E88E5',
						data: res.data
					}
				]
			}
		});
	}
}
