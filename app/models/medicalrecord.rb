class Medicalrecord < ApplicationRecord
  has_one_attached :photo

  validates_presence_of  :patient_id
  belongs_to :patient
end
