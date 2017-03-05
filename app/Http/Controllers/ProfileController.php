<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class ProfileController extends Controller
{

    protected function checkEmail($email, $id = 0)
    {
      // проверка при редактировании email
      if($id)
      {
        $user = User::where('email', $email)->where('id', '<>', $id)->first();
        if(empty($user))
          return true;
        else
          return false;
      }
      // при регистрации
      else
      {
        if(User::where('email', $email)->count())
          return false;
        else
          return true;
      }
    }

    public function getProfile(Request $request)
    {
        return $request->user();
    }
    /**
     * Instantiate a new controller instance.
     *
     * @return void
     */
    // public function __construct()
    // {
    //     $this->middleware('auth:api')->except('store');
    // }

    public function register(Request $request)
    {
      if($this->checkEmail($request->email))
      {
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
      return response()->json([
          'error' => 'Этот email уже зарегистрирован'
        ], 403);
    }

    public function setProfile(Request $request, $id)
    {
      if($this->checkEmail($request->email, $id))
      {
        $user = User::findOrFail($id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        isset($request->password) ? $user->password = bcrypt($request->password) : null ;
        $user->save();
        return response()->json([
          'status' => 'ok',
          'profile' => $user
        ]);
      }
      return response()->json([
          'error' => 'Этот email уже зарегистрирован'
        ], 403);
    }
}
