<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Book;
use Illuminate\Support\Facades\Cache;
use App\Imports\BooksImport;
use Maatwebsite\Excel\Facades\Excel;
use DB;

class ImportController extends Controller
{
    public function import() 
    {
        
        Excel::import(new BooksImport, "D:\wamp64\apps\book_rental_api\app\Books.xlsx"); //D:\wamp64\apps\book_rental_api\app\Imports\Books.xlsx
        //return redirect('/')->with('success', 'All good!');
        
    }
}
