class RemoveNationalityToDoctor < ActiveRecord::Migration
  def self.up
    remove_column :doctors, :nationality
  end

  def self.down
    add_column :doctors, :nationality, :string
  end
end
