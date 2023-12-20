<?php

namespace App\Http\Controllers;
use App\Models\uts_table;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class UtsTableController extends Controller
{
    public function index($pagination){
        $data = uts_table::pagination($pagination);
        return $data;
    }
    public function show_all(){
        $data = uts_table::all();
        return response()->json($data);

    }
    public function store(Request $request){
        $save = new uts_table;
        $save->genre = $request->genre;
        $save->reports = $request->reports;
        $save->age = $request->age;
        $save->gpa = $request->gpa;
        $save->year = $request->year;
        $save->count = $request->count;
        $save->gender = $request->gender;
        $save->nationality = $request->nationality;
        $save->save();
        return "Berhasil Menyimpan data";
    }
    public function edit(Request $request){
        $data = uts_table::all()->where('id',$request->id)->first();
        $data->genre = $request->genre;
        $data->reports = $request->reports;
        $data->age = $request->age;
        $data->gpa = $request->gpa;
        $data->year = $request->year;
        $data->count = $request->count;
        $data->gender = $request->gender;
        $data->nationality = $request->nationality;
        $data->save();
        return "Berhasil mengubah data";
    }
    public function destory(Request $request){
        $del = uts_table::all()->where('id',$request->id)->first();
        $del->delete();
        return "Berhasil menghapus data";
    }
    public function calculateAge(){
        $countRow = uts_table::avg('age');

        return response()->json($countRow);
    }
    public function calculateGpa(){
        $countRow = uts_table::avg('gpa');

        return response()->json($countRow);
    }
    public function countRespondents(){
        $countRow = uts_table::count();

        return $countRow;
    }
    public function countRespondentsAge($age){
        $countAvgRespontsAge = uts_table::where('age',$age)->count();

        return response()->json($countAvgRespontsAge);
    }
    public function countRespondentsGender($res_gender){
        $countRowGender = uts_table::where('gender',$res_gender)->count();

        return response()->json([$countRowGender]);
    }
    public function countRespondentsGpa($gpa){
        $countRespondentsGpa = uts_table::where('gpa',$gpa)->count();

        return response()->json([$countRespondentsGpa]);
    }
    public function countRespondentsNationality($nationality){
        $countRespondentsNationality = uts_table::where('nationality',$nationality)->count();

        return response()->json([$countRespondentsNationality]);
    }
    public function countRespondentsGenre($genre){
        $countRespondentsGenre = uts_table::where('genre',$genre)->count();

        return response()->json([$countRespondentsGenre]);
    }
}