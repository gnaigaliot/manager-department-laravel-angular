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
    // employee-manager
    Route::get('/departments/search', 'DepartmentController@index');
    Route::get('/employees/search', 'EmployeeController@index');
    Route::get('/positions/search', 'PositionController@index');
    Route::get('/user/get-roles', 'RolesController@index');

});