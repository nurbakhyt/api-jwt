<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use DB;
use Illuminate\Support\Facades\Redis;
use App\Console\Commands\ImportToRedis;
use App\Number;

class PhoneController extends Controller
{
  protected $numbers = [];

  public function __construct()
  {
    $this->middleware('auth');
  }

  public function index()
  {
    $count = DB::table('numbers')->count();
    return view('form', ['count' => $count]);
  }

  public function parse_csv(Request $request)
  {
    if ($request->hasFile('csv')
      && $request->file('csv')->isValid()
    )
    {
      $handle = fopen($request->csv->path(), "r");
      while(!feof($handle))
      {
        $line = fgetcsv($handle);
        if (preg_match("/^9[0-9]|^79[0-9]/", $line[0]))
          $this->numbers[] = ['number' => $line[0]];
      }
      fclose($handle);
      DB::transaction(function()
      {
        \App\NumbersModel::insert($this->numbers);
      });

      $this->dispatch(
        new ImportToRedis(new \App\NumbersModel)
      );

      $filename = date("Y-m-d_H-i-s") . '.csv';
      Storage::disk('local')->putFileAs('csv/' . $request->user()->id, $request->file('csv'), $filename);

      return redirect('/')->with('info', 'Данные загружены');
    }
    else
      return redirect('/')->with('warning', 'Выберите правильный .csv файл');
  }

  public function numbers()
  {
    $numbers = DB::table('numbers')->paginate(15);
    return view('numbers', ['numbers' => $numbers]);
  }

  public function in_redis(Request $request, Number $num)
  {
    $this->validate($request, [
      'number' => 'required|numeric'
    ]);

    if ($num->checkNumber($request->number))
    {
      $number_redis = Redis::get('numbers:'. request('number'));
      if ($number_redis)
        $status = 'есть';
      else
        $status = 'нет';
    }
    else
      $status = 'ошибка дешифрования';
    return view('number', ['status' => $status, 'numbers' => []]);
  }
}
