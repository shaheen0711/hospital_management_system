class AddPatientIdToBloodGroup < ActiveRecord::Migration
  def self.up
    add_column :blood_groups, :patient_id, :integer
  end

  def self.down
    remove_column :blood_groups, :patient_id
  end
end
