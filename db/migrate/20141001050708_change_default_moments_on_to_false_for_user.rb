class ChangeDefaultMomentsOnToFalseForUser < ActiveRecord::Migration
  def change
  	change_column_default(:users, :moments_on, false)
  end
end
