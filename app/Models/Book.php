<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Book extends Model
{
    use HasFactory;

    protected $fillable = [
        'b_title',
        'b_author',
        'b_isbn',
        'b_genre',
    ];

    public function index()
    {
        $books = Book::all();
        return response()->json($books);
    }
}
