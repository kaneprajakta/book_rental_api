1. Please import the database from book_rental_system.sql file present in book_rental_api folder.
2. Please import in postman book_rental_system.postman_collection present in book_rental_api folder.
3. Run the php artisan serve command and then run tests in collection.
Following are the links to test the apis , most of them are available in collection.
    1. Search for Books by name and or genre : http://127.0.0.1:8000/api/search_text
    2. Rent a Book : http://127.0.0.1:8000/api/rent_a_book
    3. Return a Book : http://127.0.0.1:8000/api/return_a_book 
    4. View Rental History :
         a. http://127.0.0.1:8000/api/view_rental_history   (BY TITLE)
         b. http://127.0.0.1:8000/api/view_rental_history_by_user
    
    6. Mark Overdue Rentals: Automatically mark rentals as overdue if not returned
    within 2 weeks.
    7. Email Notifications: Send an email notification to users when their rentals become
    overdue.
    Solution for 6 & 7 is achieved by running
            php artisan schedule:run
    9. Stats to show the most overdue book, most popular and least popular
       a. http://127.0.0.1:8000/api/get_most_overdue_book
       b. http://127.0.0.1:8000/api/get_most_popular_book
       c. http://127.0.0.1:8000/api/get_least_popular_book

NOTE : 
1. One additional api is developed to import csv data from xlsx http://127.0.0.1:8000/api/import
2. First run http://127.0.0.1:8000/api/books copy the csrf token string and while running other requests speially post pass this value to input header X-CSRF-TOKEN 
