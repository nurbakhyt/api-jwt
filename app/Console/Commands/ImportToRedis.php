<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Redis;

class ImportToRedis extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'to-redis';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Import from DB to Redis';

    protected $numbers;

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(\App\NumbersModel $model)
    {
        parent::__construct();
        $this->numbers = $model->all();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
      Redis::pipeline(function($pipe)
      {
        foreach ($this->numbers as $n)
        {
          $pipe->set("numbers:" . $n->number, $n->number);
        }
      });
    }
}
