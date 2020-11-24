<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::group([
    'middleware' => 'api',
], function () {

    Route::post('login', 'AuthController@login');
    Route::post('signup', 'AuthController@signup');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
    Route::get('/user/search', 'UserController@index');
    Route::post('/user', 'UserController@store');
    Route::get('/user/{id}', 'UserController@show');
    Route::delete('/user/{id}', 'UserController@destroy');
    // employee-manager

    // department
    Route::get('/departments/search', 'DepartmentController@index');
    Route::get('/departments/get-all-department', 'DepartmentController@getAllDepartment');
    Route::post('/departments', 'DepartmentController@store');
    Route::get('/departments/{id}', 'DepartmentController@show');
    Route::delete('/departments/{id}', 'DepartmentController@destroy');
    // employee
    Route::get('/employees/search', 'EmployeeController@index');
    Route::get('/employees/{id}', 'EmployeeController@show');
    Route::post('/employees', 'EmployeeController@store');
    Route::delete('/employees/{id}', 'EmployeeController@destroy');
    // position
    Route::get('/positions/search', 'PositionController@index');
    Route::get('/positions/get-all-position', 'PositionController@getAllPosition');
    Route::delete('/positions/{id}', 'PositionController@destroy');
    Route::get('/positions/{id}', 'PositionController@show');
    Route::post('/positions', 'PositionController@store');
    // user
    Route::get('/role/get-roles', 'RolesController@getAllRoles');
    // department-manager/department
    Route::get('/department-manager/department/search', 'ApartmentController@index');
    Route::get('/department-manager/department/get-all-apartment', 'ApartmentController@getAllApartment');
    Route::get('/department-manager/department/{id}', 'ApartmentController@show');
    Route::delete('/department-manager/department/{id}', 'ApartmentController@destroy');
    // department-manager/person
    Route::get('department-manager/person/search', 'PersonController@index');
    // bill/bill-electric-water
    Route::get('/bill-water-electric/search', 'BillElectricWaterController@index');
    // bill-service-type
    Route::get('/bill-service-type/search', 'BillServiceTypeController@index');
});