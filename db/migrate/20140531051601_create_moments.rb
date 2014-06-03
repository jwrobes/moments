class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
    	t.string :message
    	t.date :date
    	t.time :time
    	t.string :phone_number
    	t.belongs_to :user
    	t.timestamps
    end
  end
end
