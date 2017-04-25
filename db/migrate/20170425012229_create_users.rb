class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,                null: false
      t.string :password_digest,      null: false
      t.string :password_reset_token, null: false, limit: 60
      t.string :first_name
      t.string :last_name
      t.integer :age

      t.timestamps
    end
  end
end
