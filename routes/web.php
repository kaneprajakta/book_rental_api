<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\BookController;
use App\Http\Controllers\ImportController;
use App\Http\Controllers\Rent_activityController;

Route::get('/api/books/{search_txt}', [BookController::class, 'search_book_by_name_or_genre']);
Route::post('/api/rent_a_book', [Rent_activityController::class, 'rent']);
Route::post('/api/return_a_book', [Rent_activityController::class, 'return_book']);
Route::get('/api/view_rental_history/{book_title}', [Rent_activityController::class, 'view_ra_history_by_title']);
Route::get('/api/view_rental_history_by_user/{user_name}', [Rent_activityController::class, 'view_ra_history_by_user']);
Route::get('/api/get_most_overdue_book', [Rent_activityController::class, 'get_most_overdue_book']);
Route::get('/api/get_most_popular_book', [Rent_activityController::class, 'get_most_popular_book']);
Route::get('/api/get_least_popular_book', [Rent_activityController::class, 'get_least_popular_book']);

Route::get('/api/books', [BookController::class, 'index']);
Route::get('/api/rent_activities', [Rent_activityController::class, 'index']);
Route::get('/api/import', [ImportController::class, 'import']);



/*Route::get('/', function () {
    return view('welcome');
});*/
