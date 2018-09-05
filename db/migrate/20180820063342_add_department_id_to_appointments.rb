class AddDepartmentIdToAppointments < ActiveRecord::Migration
  def self.up
    add_column :appointments, :department_id, :integer
  end

  def self.down
    remove_column :appointments, :department_id
  end
end
