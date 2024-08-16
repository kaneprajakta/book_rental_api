<?php
namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;
use App\Mail\MyCustomMail;
use Illuminate\Support\Facades\DB;

class SendEmailsCommand extends Command
{
    protected $signature = 'emails:send';
    protected $description = 'Send custom emails';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        //$status = Mail::to('kane.prajakta@gmail.com')->send(new MyCustomMail('some data'));
        //echo $status;
        $users = DB::table('users')->join('rent_activities','ra_u_id','=','u_id')->where('ra_is_overdue','=',1)
        ->where('ra_is_notified','!=',1)->get();

        foreach ($users as $user) {
            //dd($user->email);
            $status = Mail::to('kane.prajakta@gmail.com')->send(new MyCustomMail('some data'));
            
        }

        $this->info('Emails sent successfully!');
    }
}