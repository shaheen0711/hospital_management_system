class AddBloodGroupIdToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :blood_group_id, :integer
  end

  def self.down
    remove_column :patients, :blood_group_id
  end
end
