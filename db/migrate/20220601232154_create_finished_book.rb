class CreateFinishedBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :finished, :boolean, default: false 
    end
end
