class AddUserTimeZoneToMoments < ActiveRecord::Migration
  def change
  	add_column :moments, :user_time_zone, :string
  end
end
