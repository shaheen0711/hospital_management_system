class CreateMadicalReports < ActiveRecord::Migration
  def self.up
    create_table :madical_reports do |t|
      t.integer :patient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :madical_reports
  end
end
