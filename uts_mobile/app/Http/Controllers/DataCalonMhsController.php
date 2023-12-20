<?php

namespace App\Http\Controllers;
use App\Models\dataCalonMhs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class DataCalonMhsController extends Controller
{
    public function index($pagination){
        $data = dataCalonMhs::pagination($pagination);
        return $data;
    }
    public function show_all(){
        $data = dataCalonMhs::all();
        return response()->json($data);

    }
    public function store(Request $request){
        $save = new dataCalonMhs;
        $save->nomor_pendaftaran = $request->nomor_pendaftaran;
        $save->nama_lengkap = $request->nama_lengkap;
        $save->kelamin = $request->kelamin;
        $save->agama = $request->agama;
        $save->provinsi = $request->provinsi;
        $save->tipe_sekolah = $request->tipe_sekolah;
        $save->jenis_sekolah = $request->jenis_sekolah;
        $save->akreditasi_sekolah = $request->akreditasi_sekolah;
        $save->jurusan_asal = $request->jurusan_asal;
        $save->daftar_bidikmisi = $request->daftar_bidikmisi;
        $save->pilihan_poltek_1 = $request->pilihan_poltek_1;
        $save->pilihan_prodi_1 = $request->pilihan_prodi_1;
        $save->pilihan_poltek_2 = $request->pilihan_poltek_2;
        $save->pilihan_prodi_2 = $request->pilihan_prodi_2;
        $save->pilihan_poltek_3 = $request->pilihan_poltek_3;
        $save->pilihan_prodi_3 = $request->pilihan_prodi_3;
        $save->prestasi = $request->prestasi;
        $save->save();
        return "Berhasil Menyimpan data";
    }
    public function edit(Request $request){
        $data = dataCalonMhs::all()->where('id',$request->id)->first();
        $data->nomor_pendaftaran = $request->nomor_pendaftaran;
        $data->nama_lengkap = $request->nama_lengkap;
        $data->kelamin = $request->kelamin;
        $data->agama = $request->agama;
        $data->provinsi = $request->provinsi;
        $data->tipe_sekolah = $request->tipe_sekolah;
        $data->jenis_sekolah = $request->jenis_sekolah;
        $data->akreditasi_sekolah = $request->akreditasi_sekolah;
        $data->jurusan_asal = $request->jurusan_asal;
        $data->daftar_bidikmisi = $request->daftar_bidikmisi;
        $data->pilihan_poltek_1 = $request->pilihan_poltek_1;
        $data->pilihan_prodi_1 = $request->pilihan_prodi_1;
        $data->pilihan_poltek_2 = $request->pilihan_poltek_2;
        $data->pilihan_prodi_2 = $request->pilihan_prodi_2;
        $data->pilihan_poltek_3 = $request->pilihan_poltek_3;
        $data->pilihan_prodi_3 = $request->pilihan_prodi_3;
        $data->prestasi = $request->prestasi;
        $data->save();
        return "Berhasil mengubah data";
    }
    public function destory(Request $request){
        $del = dataCalonMhs::all()->where('nomor_pendaftaran',$request->id)->first();
        $del->delete();
        return "Berhasil menghapus data";
    }
    public function countCalonmMhs(){
        $countRow = dataCalonMhs::count();

        return $countRow;
    }
    public function countCalonmMhsGender($res_gender){
        $countRowGender = dataCalonMhs::where('kelamin',$res_gender)->count();

        return response()->json([$countRowGender]);
    }
    public function countCalonmMhsProvinsi($provinsi){
        $countCalonmMhsProvinsi = dataCalonMhs::where('provinsi',$provinsi)->count();

        return response()->json([$countCalonmMhsProvinsi]);
    }
}