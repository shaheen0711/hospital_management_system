class CreateBedallocations < ActiveRecord::Migration
  def self.up
    create_table :bedallocations do |t|
      t.integer :room_id
      t.integer :patient_id
      t.integer :bed_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bedallocations
  end
end
