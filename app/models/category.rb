class Category < ActiveRecord::Base
    has_many :books, dependent: :destroy
    validates :name, presence: :true 

   
end