class AddCountryIdToDoctor < ActiveRecord::Migration
  def self.up
    add_column :doctors, :country_id, :integer
  end

  def self.down
    remove_column :doctors, :country_id
  end
end
