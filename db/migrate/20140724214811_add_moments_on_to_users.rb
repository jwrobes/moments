class AddMomentsOnToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :moments_on, :boolean, :default => true
  end
end
