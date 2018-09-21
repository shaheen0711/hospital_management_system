class AddIndexOnDoctor < ActiveRecord::Migration
  def self.up
    add_index :doctors, :doctor_id, :name => "index_by_doctor_id"
  end

  def self.down
    remove_index :doctors, :name => "index_by_doctor_id"
  end
end
