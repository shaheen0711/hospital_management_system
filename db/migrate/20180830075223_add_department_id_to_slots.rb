class AddDepartmentIdToSlots < ActiveRecord::Migration
  def self.up
    add_column :slots, :department_id, :integer
  end

  def self.down
    remove_column :slots, :department_id
  end
end
