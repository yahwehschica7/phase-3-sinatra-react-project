class BooksController < ApplicationController
    get "/books" do 
        book = Book.all 
        book.to_json
    end
end