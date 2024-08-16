<?php
namespace App\Console;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Illuminate\Console\Scheduling\Schedule;
use App\Console\Commands\SendEmailsCommand;

class Kernel extends ConsoleKernel{
    protected $commands = [
        App\Console\Commands\SendEmailsCommand::class
    ];

    protected function schedule(Schedule $schedule)
    {
        // $schedule->command("inspire")->hourly();
    }
}