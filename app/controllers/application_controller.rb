class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/" do 
    {message: "Welcome to your InfiniteTBR pile"}.to_json
    #put a Book.find that looks for params of true or false for the toberead pile. If true
    #book.to_json(include: :toberead)
    #if false, "You've already read this book"
  end
  #categories****

  get "/categories" do 
    categories = Category.all 
    categories.to_json(include: :books)
  end

  get "/edit" do

  end

  get "/categories/:id" do 
   category = Category.find_by_id(params["id"]) 
   if category
    category.to_json(include: :books)
   else 
    "404-Category Not Found"
   end 
  end

  post "/categories" do 
    category = Category.create(name: params[:name])
    category.to_json(include: :books)
  end

  delete "/categories/:id" do 
    category = Category.find_by_id(params["id"])
    if category
      category.destory
      category.to_json
    else 
      {errors: ["Category not found"]}.to_json
    end
  end

  
#validation with models is confirming that 
#the inputted data is correct


  #books****

  get "/books" do 
    books = Book.all
    books.to_json
  end

  
  


  
end
