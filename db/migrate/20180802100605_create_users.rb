class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :hashed_password
      t.string :password_salt
      t.string :user_type
      t.boolean :is_blocked, :default => false
      t.boolean :is_deleted, :default => false 

      t.timestamps
      
#      add_index :users, [:user_type, :first_name], :name =>  "index by user_type", :unique => true
    end
  end

  def self.down
    drop_table :users
  end
end
