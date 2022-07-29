class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/" do 
    {messages: "Welcome"}.to_json
  end

  get "/categories" do 
    categories = Category.all 
    categories.to_json(include: :books)
  end

  get "/categories/:id" do 
   category = Category.find_by_id(params["id"]) 
   if category
    category.to_json(include: :books)
   else 
    "404-Category Not Found"
   end 
  end

  post "/categories/:category_id/books" do
    category = Category.find_by_id(params["category_id"])
    books = category.books.build(params)
    if book.save
      book.to_json
    else
      {errors: ["Save Failed"]}.to_json
    end
  end

  post "/categories" do 
    category = Category.create(name: params[:name])
    category.to_json(include: :books)
  end

  delete "/categories/:id" do 
    category = Category.find_by_id(params["id"])
    if category
      category.destroy
      category.to_json
    else 
      {errors: ["Category not found"]}.to_json
    end
  end

  
#validation with models is confirming that 
#the inputted data is correct


  #books****

  get "/books" do 
    book = Book.all 
    book.to_json
  end

  get "/books/:id" do 
   book = Book.find_by_id(params["id"]) 
   if book
    book.to_json
   else 
    "404-Book Not Found"
   end 
  end

  post "/books" do 
    book = Book.create(params)
    book.to_json
  end

  delete "/books/:id" do 
    book = Book.find_by_id(params["id"])
    if book
      book.destroy
      book.to_json
    else 
      {errors: ["Book not found"]}.to_json
    end
  end


  
  


  
end
