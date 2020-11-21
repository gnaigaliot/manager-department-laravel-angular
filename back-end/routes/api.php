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
    Route::get('/departments/search', 'DepartmentController@index');
    Route::get('/departments/{id}', 'DepartmentController@show');
    Route::delete('/departments/{id}', 'DepartmentController@destroy');
    Route::post('/deparments', 'DepartmentController@store');
    // departments
    Route::get('/employees/search', 'EmployeeController@index');
    // position
    Route::get('/positions/search', 'PositionController@index');
    // user
    Route::get('/role/get-roles', 'RolesController@getAllRoles');
    // department-manager/department
    Route::get('/department-manager/department/search', 'ApartmentController@index');
    Route::get('/department-manager/department/get-all-apartment', 'ApartmentController@getAllApartment');
    // department-manager/person
    Route::get('department-manager/person/search', 'PersonController@index');
    // bill/bill-electric-water
    Route::get('/bill-water-electric/search', 'BillElectricWaterController@index');
    // bill-service-type
    Route::get('/bill-service-type/search', 'BillServiceTypeController@index');
});