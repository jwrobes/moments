class AddNumberOfMomentsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :num_moments, :integer, default: 5 
  end
end
