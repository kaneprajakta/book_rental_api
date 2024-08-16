<?php

namespace App\Http\Controllers;

use App\Models\Rent_activity;
use App\Models\User;
use App\Models\Book;
use Illuminate\Http\Request;

use DB;
class Rent_activityController extends Controller
{
    public function index()
    {
        $rent_activities = DB::table('rent_activities')
            ->join('users', 'users.u_id', '=', 'rent_activities.ra_u_id')
            ->join('books', 'books.b_id', '=', 'rent_activities.ra_b_id')
            ->select('users.name', 'books.b_title', 'rent_activities.ra_rented_on', 'rent_activities.ra_return_due_on',
                    'rent_activities.ra_actual_return_dt','rent_activities.ra_is_overdue','rent_activities.ra_is_notified')
            ->get();
        //$rent_activities = Rent_activity::all();
        return response()->json($rent_activities);
    }

    public function rent(Request $request){
        
        //return csrf_token(); 
        if($request->isMethod('post')){
            /*$request->validate(['user_name' => 'required|max:191|exists:users,name',
                    'book_title' => 'required|max:191|exists:books,b_title',],[
                       'book_title.exists' => 'Kindly re-check the book title.',
                       'user_name.exists' => 'Kindly re-check the user name.' ,
                    ]);*/
                    /*$request->validate([
                        'user_name' => ['required|max:191',Rule::exists('users')->where(function () {
                                                                                return User::where('name', $request->post('user_name'));}]
                  ,'book_title' => 'required|max:191',
                ]);*/
                          //echo $request->user_name."cccc".$request->book_title."dddd";exit;
                $user_id = trim(User::where('name','=',$request->user_name)->pluck('u_id'),'[]');//echo "ccc";
                $book_id  = trim(Book::where('b_title','=',$request->book_title)->pluck('b_id'),'[]');
                $if_book_already_with_user = Rent_activity::where(['ra_u_id' => $user_id ,'ra_b_id' => $book_id , 'ra_actual_return_dt' => NULL])->count();
                $if_user_has_some_book = Rent_activity::where(['ra_u_id' => $user_id ,'ra_actual_return_dt' => NULL])->count();
                $return_due = strtotime('+2 weeks');
            if($user_id == NULL){
                return response()->json('Kindly re-check the user name.');
            }else if($book_id == NULL){
                return response()->json('Kindly re-check the book title.');
            }else if($if_book_already_with_user){
                return response()->json('Sorry! It seems the book is already with you..');
            }else if($if_user_has_some_book){
                return response()->json('Sorry! Please return the book with you before you rent this book ..');
            }else{
                    $user = Rent_activity::create([
                'ra_u_id' => $user_id,
                'ra_b_id' => $book_id,
                'ra_rented_on' => now(),
                'ra_return_due_on' => date('Y-m-d',$return_due),
            ]);
                $last_order_id = DB::getPdo()->lastInsertId();
                       
                return response()->json('All good!Book is rented! Please return the book before '.date('d-m-Y',$return_due)); 
            }
         }
        
    }

    public function return_book(Request $request){
        $user_id = trim(User::where('name','=',$request->user_name)->pluck('u_id'),'[]');//echo "ccc";
        $book_id  = trim(Book::where('b_title','=',$request->book_title)->pluck('b_id'),'[]');
        $if_book_already_returned = Rent_activity::where(['ra_u_id' => $user_id ,'ra_b_id' => $book_id , ['ra_actual_return_dt' ,'!=',NULL ]])->count();
        if($user_id == NULL){
            return response()->json('Kindly re-check the user name.');
        }else if($book_id == NULL){
            return response()->json('Kindly re-check the book title.');
        }else if($if_book_already_returned){
            return response()->json('Sorry! It seems you alredy returned this book.');
        }else{
            $user = DB::table('rent_activities')->where([
            'ra_u_id' => $user_id,
            'ra_b_id' => $book_id,])->update([
            'ra_actual_return_dt' => now()]);
            $last_order_id = DB::getPdo()->lastInsertId();
                   
            return response()->json('Thank you.'); 
        }
    }

        public function view_ra_history_by_title(Request $request,$book_title){
            //return csrf_token();
            $book_id  = trim(Book::where('b_title','=',$book_title)->pluck('b_id'),'[]');
            if($book_id == NULL){
                return response()->json('Kindly re-check the book title.Please give the exact book title.');

            }else{
                // get the name of all users who rented the book in chronological order
                $history_str = DB::table('users')->leftjoin('rent_activities','users.u_id','=','rent_activities.ra_u_id')->where('ra_b_id','=',$book_id)->
                select('users.name','ra_rented_on','ra_actual_return_dt')->orderBy('ra_rented_on','asc')->get();
                return response()->json($history_str);
            }
        }

        public function view_ra_history_by_user(Request $request,$user_name){
            //return csrf_token();
            $user_id = trim(User::where('name','=',$request->user_name)->pluck('u_id'),'[]');//echo "ccc";
            if($user_id == NULL){
                return response()->json('Kindly re-check the user name.Please give the exact user name.');

            }else{
                // get the name of all users who rented the book in chronological order
                $history_str = DB::table('books')->leftjoin('rent_activities','books.b_id','=','rent_activities.ra_b_id')->where('ra_u_id','=',$user_id)->
                select('books.b_title','ra_rented_on','ra_actual_return_dt')->orderBy('ra_rented_on','asc')->get();
                return response()->json($history_str);
            }
        }

        public function get_most_overdue_book(){
            $book_title = DB::table('rent_activities')->leftjoin('books','books.b_id','=','rent_activities.ra_b_id')->select('b_title','ra_return_due_on')->orderBy('ra_return_due_on','asc')->first();
            return response()->json($book_title);
        }

        public function get_most_popular_book(){
            $obj = DB::table('rent_activities')->select('ra_b_id',DB::raw('COUNT(ra_b_id) as cnt'))->groupBy('ra_b_id')->orderBy('cnt','desc')->first();
            //$tmp_obj = json_decode($str_json);
            $b_id = $obj->ra_b_id;
            $b_title = DB::table('books')->where('b_id',$b_id)->pluck('b_title');
            return $b_title;
        }

        public function get_least_popular_book(){
            $obj = DB::table('rent_activities')->select('ra_b_id',DB::raw('COUNT(ra_b_id) as cnt'))->groupBy('ra_b_id')->orderBy('cnt','asc')->first();
            //$tmp_obj = json_decode($str_json);
            $b_id = $obj->ra_b_id;
            $b_title = DB::table('books')->where('b_id',$b_id)->pluck('b_title');
            return $b_title;
        }

}
