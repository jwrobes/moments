class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
    	t.string :message
    	t.date :date
    	t.time :time
    	t.belongs_to :user
    	t.timestamps
    end
  end
end
