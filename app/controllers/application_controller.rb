class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/" do 
    {message: "Welcome to your InfiniteTBR pile"}.to_json
    #put a Book.find that looks for params of true or false for the toberead pile. If true
    #book.to_json(include: :toberead)
    #if false, "You've already read this book"
  end

  get "/categories" do 
    categories = Category.all 
    categories.to_json(include: :books)
  end

  get "/books" do 
    books = Book.all
    books.to_json
  end

  

  
end
