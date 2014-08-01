class ChangeTimeTypeToDatetimeForMoments < ActiveRecord::Migration
  def change
  	remove_column :moments, :time, :time
  	add_column :moments, :time, :datetime
  end
end
