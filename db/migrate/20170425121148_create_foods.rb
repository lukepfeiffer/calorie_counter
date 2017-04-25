class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :serving_size
      t.integer :calories
      t.integer :meal_id
      t.string :type
    end
  end
end
