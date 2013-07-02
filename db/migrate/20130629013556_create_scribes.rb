class CreateScribes < ActiveRecord::Migration
  def change
    create_table :scribes do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :scribes, :email, unique: true
  end
end
