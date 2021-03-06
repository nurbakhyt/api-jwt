<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', 'PhoneController@index');
Route::post('/', 'PhoneController@parse_csv');

Route::get('/numbers', 'PhoneController@numbers');
Route::get('/get', 'PhoneController@in_redis');

Auth::routes();

Route::get('/home', 'HomeController@index');
