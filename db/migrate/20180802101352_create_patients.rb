class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.integer :user_id
      t.date :date_of_birth
      t.string :address
      t.string :contact_number
      t.string :email
      t.string :gender
      t.string :blood_group

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
