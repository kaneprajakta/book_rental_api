<?php

namespace App\Imports;

use App\Models\Book;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class BooksImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        $objB = new Book([
            "b_title" => $row['title'],
            "b_author" => $row['author'],
            "b_isbn" => $row['isbn'],
            "b_genre" => $row['genre']
            ]);
            //dd($objB);exit;
        return $objB;
    }
    
}
