class RemoveBloodGroupToPatient < ActiveRecord::Migration
  def self.up
    remove_column :patients, :blood_group
  end

  def self.down
    add_column :patients, :blood_group, :string
  end
end
