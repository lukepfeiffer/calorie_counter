class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.date :date_eaten
      t.time :time_eaten
      t.integer :user_id
      t.timestamps
    end
  end
end
