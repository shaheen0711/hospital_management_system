class CreateMedicalrecords < ActiveRecord::Migration
  def self.up
    create_table :medicalrecords do |t|
      t.integer :patient_id
      t.text :doctor_observation
      t.text :prescription

      t.timestamps
    end
  end

  def self.down
    drop_table :medicalrecords
  end
end
