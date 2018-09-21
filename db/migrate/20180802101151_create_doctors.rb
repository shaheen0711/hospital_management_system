class CreateDoctors < ActiveRecord::Migration
  def self.up
    create_table :doctors do |t|
      t.integer :user_id, :null => false
      t.integer :department_id
      t.string :qualification
      t.string :experience
      t.string :nationality
      t.date :date_of_birth
      t.string :address
      t.string :contact_number
      t.string :email
      t.string :gender

      t.timestamps
    end
  end

  def self.down
    drop_table :doctors
  end
end
