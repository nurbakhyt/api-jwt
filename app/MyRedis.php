<?php

namespace App;

use Illuminate\Support\Facades\Redis;

class MyRedis
{


  
  public function import($numbers = [])
  {
    Redis::pipeline(function($pipe) use($numbers)
    {
      foreach ($numbers as $n)
      {
        $pipe->set("numbers:" . $n['number'], $n['number']);
      }
    });
  }

  public function get()
  {

  }
}
