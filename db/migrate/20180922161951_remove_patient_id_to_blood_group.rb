class RemovePatientIdToBloodGroup < ActiveRecord::Migration
  def self.up
    remove_column :blood_groups, :patient_id
  end

  def self.down
    add_column :blood_groups, :patient_id, :integer
  end
end
