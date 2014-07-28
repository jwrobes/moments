class AddMessageColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :message, :text, :default => "It's time to take a moment."
  end
end
