class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :hashed_password
      t.string :password_salt
      t.string :user_type
      t.boolean :is_blocked
      t.boolean :is_deleted

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
