<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Book;
use Illuminate\Support\Facades\Cache;
use App\Imports\BooksImport;
use Maatwebsite\Excel\Facades\Excel;
use DB;
//use Illuminate\Support\Facades\Mail;
//use App\Mail\MyCustomMail;

class BookController extends Controller
{
    public function index(){
        
        $books = Book::all();
        return response()->json($books); 
        
        //$this->info('Emails sent successfully!');

    }
    public function search_book_by_name_or_genre(Request $request,$serch_txt){
        $books = DB::table('books')->where('b_title','like','%'.$serch_txt.'%')->orWhere('b_genre','like','%'.$serch_txt.'%')->get();
        return response()->json($books); 
    }

    public function import() 
    {
        echo "here";exit;
        Excel::import(new BooksImport, ""); //D:\wamp64\apps\book_rental_api\app\Imports\Books.xlsx
        return redirect('/')->with('success', 'All good!');
        
    }
}
