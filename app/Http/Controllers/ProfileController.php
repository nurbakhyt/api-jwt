<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class ProfileController extends Controller
{

    // получение профиля
    public function getProfile(Request $request)
    {
        return $request->user();
    }

    // регистрация
    public function register(Request $request)
    {
      $this->validate($request, [
        'name' => 'required|max:255',
        'email' => 'required|email|max:255|unique:users',
        'password' => 'required|min:6',
      ]);
      $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'phone' => $request->phone,
        'password' => bcrypt($request->password),
      ]);
      return response()->json([
        'status' => 'ok',
        'profile' => $user
      ]);
    }

    // Обновление профиля
    public function setProfile(Request $request, $id)
    {
      $this->validate($request, [
        'name' => 'required|max:255',
        'email' => 'required|email|max:255|unique:users,email,'.$request->user()->id,
        'password' => 'sometimes|min:6',
      ]);

      $user = User::findOrFail($id);
      $user->name = $request->name;
      $user->email = $request->email;
      $user->phone = $request->phone;
      isset($request->password) ? $user->password = bcrypt($request->password) : null;
      $user->save();

      return response()->json([
        'status' => 'ok',
        'profile' => $user
      ]);
    }
}
