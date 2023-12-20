<?php

namespace App\Http\Controllers;
use App\Models\dataMhsAkademik;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class DataMhsAkademikController extends Controller
{
    public function index($pagination){
        $data = dataMhsAkademik::pagination($pagination);
        return $data;
    }
    public function show_all(){
        $data = dataMhsAkademik::all();
        return response()->json($data);

    }
    public function store(Request $request){
        $save = new dataMhsAkademik;
        $save->nim = $request->nim;
        $save->name = $request->name;
        $save->status_akhir = $request->status_akhir;
        $save->status_2018_1 = $request->status_2018_1;
        $save->ipk_2018_1 = $request->ipk_2018_1;
        $save->sks_2018_1 = $request->sks_2018_1;
        $save->status_2018_2 = $request->status_2018_2;
        $save->ipk_2018_2 = $request->ipk_2018_2;
        $save->sks_2018_2 = $request->sks_2018_2;
        $save->status_2019_1 = $request->status_2019_1;
        $save->ipk_2019_1 = $request->ipk_2019_1;
        $save->sks_2019_1 = $request->sks_2019_1;
        $save->status_2019_2 = $request->status_2019_2;
        $save->ipk_2019_2 = $request->ipk_2019_2;
        $save->sks_2019_2 = $request->sks_2019_2;
        $save->status_2020_1 = $request->status_2020_1;
        $save->ipk_2020_1 = $request->ipk_2020_1;
        $save->sks_2020_1 = $request->sks_2020_1;
        $save->status_2020_2 = $request->status_2020_2;
        $save->ipk_2020_2 = $request->ipk_2020_2;
        $save->sks_2020_2 = $request->sks_2020_2;
        $save->status_2021_1 = $request->status_2021_1;
        $save->ipk_2021_1 = $request->ipk_2021_1;
        $save->sks_2021_1 = $request->sks_2021_1;
        $save->status_2021_2 = $request->status_2021_2;
        $save->ipk_2021_2 = $request->ipk_2021_2;
        $save->sks_2021_2 = $request->sks_2021_2;
        $save->status_2022_1 = $request->status_2022_1;
        $save->ipk_2022_1 = $request->ipk_2022_1;
        $save->sks_2022_1 = $request->sks_2022_1;
        $save->status_2022_2 = $request->status_2022_2;
        $save->ipk_2022_2 = $request->ipk_2022_2;
        $save->sks_2022_2 = $request->sks_2022_2;
        $save->status_2023_1 = $request->status_2023_1;
        $save->ipk_2023_1 = $request->ipk_2023_1;
        $save->sks_2023_1 = $request->sks_2023_1;
        $save->save();
        return "Berhasil Menyimpan data";
    }
    public function edit(Request $request){
        $data = dataMhsAkademik::all()->where('nim',$request->id)->first();
        $data->nim = $request->nim;
        $data->name = $request->name;
        $data->status_akhir = $request->status_akhir;
        $data->status_2018_1 = $request->status_2018_1;
        $data->ipk_2018_1 = $request->ipk_2018_1;
        $data->sks_2018_1 = $request->sks_2018_1;
        $data->status_2018_2 = $request->status_2018_2;
        $data->ipk_2018_2 = $request->ipk_2018_2;
        $data->sks_2018_2 = $request->sks_2018_2;
        $data->status_2019_1 = $request->status_2019_1;
        $data->ipk_2019_1 = $request->ipk_2019_1;
        $data->sks_2019_1 = $request->sks_2019_1;
        $data->status_2019_2 = $request->status_2019_2;
        $data->ipk_2019_2 = $request->ipk_2019_2;
        $data->sks_2019_2 = $request->sks_2019_2;
        $data->status_2020_1 = $request->status_2020_1;
        $data->ipk_2020_1 = $request->ipk_2020_1;
        $data->sks_2020_1 = $request->sks_2020_1;
        $data->status_2020_2 = $request->status_2020_2;
        $data->ipk_2020_2 = $request->ipk_2020_2;
        $data->sks_2020_2 = $request->sks_2020_2;
        $data->status_2021_1 = $request->status_2021_1;
        $data->ipk_2021_1 = $request->ipk_2021_1;
        $data->sks_2021_1 = $request->sks_2021_1;
        $data->status_2021_2 = $request->status_2021_2;
        $data->ipk_2021_2 = $request->ipk_2021_2;
        $data->sks_2021_2 = $request->sks_2021_2;
        $data->status_2022_1 = $request->status_2022_1;
        $data->ipk_2022_1 = $request->ipk_2022_1;
        $data->sks_2022_1 = $request->sks_2022_1;
        $data->status_2022_2 = $request->status_2022_2;
        $data->ipk_2022_2 = $request->ipk_2022_2;
        $data->sks_2022_2 = $request->sks_2022_2;
        $data->status_2023_1 = $request->status_2023_1;
        $data->ipk_2023_1 = $request->ipk_2023_1;
        $data->sks_2023_1 = $request->sks_2023_1;
        $data->save();
        return "Berhasil mengubah data";
    }
    public function destory(Request $request){
        $del = dataMhsAkademik::all()->where('nim',$request->id)->first();
        $del->delete();
        return "Berhasil menghapus data";
    }
    public function countCalonmMhs(){
        $countRow = dataMhsAkademik::count();

        return $countRow;
    }
    public function countMhsStatusAkhir($status){
        $countStatusAkhir = dataMhsAkademik::where('status_akhir',$status)->count();

        return response()->json($countStatusAkhir);
    }

    public function calculateIpk($ipk){
        $calculateIpk = dataMhsAkademik::avg("$ipk");

        return response()->json($calculateIpk);
    }
    // public function calculateIpk2018_2(){
    //     $calculateIpk = dataMhsAkademik::avg('ipk_2018_2');

    //     return response()->json($calculateIpk);
    // }
    // public function calculateIpk2019_1(){
    //     $calculateIpk = dataMhsAkademik::avg('ipk_2019_1');

    //     return response()->json($calculateIpk);
    // }
    // public function calculateIpk2019_2(){
    //     $calculateIpk = dataMhsAkademik::avg('ipk_2019_2');

    //     return response()->json($calculateIpk);
    // }
    // public function calculateIpk2020_1(){
    //     $calculateIpk = dataMhsAkademik::avg('ipk_2019_1');

    //     return response()->json($calculateIpk);
    // }
    // public function calculateIpk2020_2(){
    //     $calculateIpk = dataMhsAkademik::avg('ipk_2019_2');

    //     return response()->json($calculateIpk);
    // }
    // public function calculateIpk2021_1(){
    //     $calculateIpk = dataMhsAkademik::avg('ipk_2019_1');

    //     return response()->json($calculateIpk);
    // }
    // public function calculateIpk2021_2(){
    //     $calculateIpk = dataMhsAkademik::avg('ipk_2019_2');

    //     return response()->json($calculateIpk);
    // }
}