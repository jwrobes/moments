class AddSentColumnToMoments < ActiveRecord::Migration
  def change
  	add_column :moments, :sent, :boolean, :default => false
  end
end

