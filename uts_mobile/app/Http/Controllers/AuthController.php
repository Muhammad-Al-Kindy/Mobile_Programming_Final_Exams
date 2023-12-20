<?php

namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
class AuthController extends Controller
{
    function Register(Request $request){
        $save = new user;
        $save->nim = $request->nim;
        $save->name = $request->name;
        $save->email = $request->email;
        $save->nohp = $request->nohp;
        $save->gender = $request->gender;
        $save->password = Hash::make($request->password);
        $save->save();
        return "Berhasil Menyimpan data";
    }

    function Edit(Request $request){
        $data = User::all()->where('nim',$request->nim)->first();
        $data->email = $request->email;
        $data->nohp = $request->nohp;
        $data->gender = $request->gender;
        $data->password = Hash::make($request->password);
        $data->save();
        return "Berhasil Merubah data";
    }

    function Login(Request $request){
        $user = User::where('nim', $request->nim)->first();

        if($user!='[]' && Hash::check($request->password, $user->password)){
            return "Anda berhasil login";
        }
    }
    function Search(Request $request){
        $user = User::where('nim', $request->nim)->first();
        return response()->json($user);
    }
}