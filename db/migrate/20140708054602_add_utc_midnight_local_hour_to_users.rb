class AddUtcMidnightLocalHourToUsers < ActiveRecord::Migration
  def change
  	  	add_column :users, :utc_local_midnight, :integer
  end
end
