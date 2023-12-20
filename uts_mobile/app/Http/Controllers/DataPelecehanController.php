<?php

namespace App\Http\Controllers;
use App\Models\DataPelecehan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class DataPelecehanController extends Controller
{
    public function index($pagination){
        $data = DataPelecehan::pagination($pagination);
        return $data;
    }
    public function show_all(){
        $data = DataPelecehan::all();
        return response()->json($data);

    }
    public function store(Request $request){
        $save = new DataPelecehan;
        $save->nim = $request->nim;
        $save->name = $request->name;
        $save->nohp = $request->nohp;
        $save->jenisLaporan = $request->jenisLaporan;
        $save->kronologi = $request->kronologi;
        $save->bukti = $request->bukti;
        $save->save();
        return "Berhasil Menyimpan data";
    }
    public function edit(Request $request){
        $data = DataPelecehan::all()->where('nim',$request->nim)->first();
        $data->nim = $request->nim;
        $data->name = $request->name;
        $data->nohp = $request->nohp;
        $data->jenisLaporan = $request->jenisLaporan;
        $data->kronologi = $request->kronologi;
        $data->bukti = $request->bukti;
        $data->save();
        return "Berhasil mengubah data";
    }
    public function destory(Request $request){
        $del = DataPelecehan::all()->where('nim',$request->nim)->first();
        $del->delete();
        return "Berhasil menghapus data";
    }
}
