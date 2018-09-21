class AddIndexOnRoom < ActiveRecord::Migration
  def self.up
    add_index :beds, :room_id, :name => "index_by_room_id"
  end

  def self.down
    remove_index :beds, :name => "index_by_room_id"
  end
end
