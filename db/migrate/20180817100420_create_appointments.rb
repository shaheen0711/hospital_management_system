class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.date :appointment_date
      t.integer :slot_id

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
