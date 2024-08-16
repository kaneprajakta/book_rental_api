<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

use Illuminate\Support\Facades\DB;

class Rent_activity extends Model
{
    use HasFactory;
    protected $fillable = [
        'ra_b_id',
        'ra_u_id',
        'ra_rented_on',
        'ra_return_due_on',
        'ra_actual_return_dt',
        'ra_is_overdue',
        'ra_is_notified',
    ];

    public function index()
    {
        $rent_activities = DB::table('rent_activities')
            ->join('users', 'users.id', '=', 'rent_activities.ra_u_id')
            ->join('books', 'books.b_id', '=', 'rent_activities.ra_b_id')
            ->select('users.name', 'books.b_title', 'rent_activities.ra_rented_on', 'rent_activities.ra_return_due_on',
                    'rent_activities.ra_actual_return_dt','rent_activities.ra_is_overdue','rent_activities.ra_is_notified')
            ->get();
        //$rent_activities = Rent_activity::all();
        return response()->json($rent_activities);
    }

    

    

}

 
