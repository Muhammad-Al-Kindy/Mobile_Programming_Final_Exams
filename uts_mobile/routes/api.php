<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UtsTableController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('all_data',[UtsTableController::class,"index"]);
Route::post('create_data',[UtsTableController::class,"store"]);
Route::get('show_data',[UtsTableController::class,"show_all"]);
Route::post('edit_data',[UtsTableController::class,"edit"]);
Route::post('delete_data',[UtsTableController::class,"destory"]);
Route::controller(UtsTableController::class)->group(function(){
    Route::get('/avg/age',"calculateAge");
    Route::get('/avg/gpa',"calculateGpa");
});
Route::controller(UtsTableController::class)->group(function(){
    Route::get('/count/respondents',"countRespondents");
    Route::get('/count/age/{age}',"countRespondentsAge");
    Route::get('/count/gender/{gender}',"countRespondentsGender");
    Route::get('/count/gpa/{gpa}',"countRespondentsGpa");
    Route::get('/count/nationality/{nationality}',"countRespondentsNationality");
});
