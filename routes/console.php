<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schedule;
use App\Console\Commands\SendEmailsCommand;

/*Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote')->hourly();
*/
 //->withoutOverlapping(10)
Schedule::command(SendEmailsCommand::class)->everyMinute()->withoutOverlapping()->sendOutputTo("scheduler-output.log")->when(function () {
    //mark overdue rentals
    $update = DB::table('rent_activities')->where('ra_return_due_on','<',date('Y-m-d h:i:s'))->where('ra_is_overdue','=',1)->where('ra_is_notified','!=',1)->update(['ra_is_notified' => 1]);
    if($update) return true;
    //return true;
});