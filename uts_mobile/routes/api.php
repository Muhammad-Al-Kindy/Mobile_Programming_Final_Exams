<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UtsTableController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DataCalonMhsController;
use App\Http\Controllers\DataMhsAkademikController;

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

Route::get("all_data/{paginate}",[UtsTableController::class,"index"]);
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
    Route::get('/count/genre/{genre}',"countRespondentsGenre");
    Route::get('/count/age/{age}',"countRespondentsAge");
    Route::get('/count/gender/{gender}',"countRespondentsGender");
    Route::get('/count/gpa/{gpa}',"countRespondentsGpa");
    Route::get('/count/nationality/{nationality}',"countRespondentsNationality");
});
Route::controller(AuthController::class)->group(function(){
    Route::post('/register',"Register");
    Route::post('/login',"Login");
    Route::get('/search/{nim}',"Search");
    Route::post('/edit/{nim}',"Edit");
});
Route::controller(DataCalonMhsController::class)->group(function(){
    Route::get('/count/calonmhs',"countCalonmMhs");
    Route::get('/count/gendercalon/{gender}',"countCalonmMhsGender");
    Route::get('/count/provinsicalon/{provinsi}',"countCalonmMhsProvinsi");
});
Route::controller(DataMhsAkademikController::class)->group(function(){
    Route::get('/count/status/{status}',"countMhsStatusAkhir");
    Route::get('/avg/calculateIpk/{ipk}',"calculateIpk");
    // Route::get('/avg/calculate2018_2',"calculateIpk2018_2");
    // Route::get('/avg/calculate2019_1',"calculateIpk2019_1");
    // Route::get('/avg/calculate2019_2',"calculateIpk2019_2");
    // Route::get('/avg/calculate2020_1',"calculateIpk2020_1");
    // Route::get('/avg/calculate2020_2',"calculateIpk2020_2");
    // Route::get('/avg/calculate2021_1',"calculateIpk2021_1");
    // Route::get('/avg/calculate2021_2',"calculateIpk2021_2");
});
