class CreateBedAllocations < ActiveRecord::Migration
  def self.up
    create_table :bed_allocations do |t|
      t.integer :room_id
      t.integer :patient_id
      t.integer :bed_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bed_allocations
  end
end
