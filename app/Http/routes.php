<?php 

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
	return View::make('hello');
});


Route::resource('users', 'UsersController');
Route::resource('software', 'SoftwareController');
Route::resource('softsubscription', 'SoftSubscriptionController');
Route::resource('softwarebrands', 'SoftwareBrandsController');
Route::resource('softwareproducts', 'SoftwareProductsController');
Route::resource('subscriptiontypes', 'SubscriptionTypesController');
