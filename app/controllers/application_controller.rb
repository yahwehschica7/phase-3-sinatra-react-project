class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/" do 
    {message: "Welcome to your InfiniteTBR pile"}.to_json
  end

  get "/categories" do 
    Category.all.to_json 
  end

  get "/books" do 
    Book.all.to_json
  end

  

  
end
