class BloodGroup < ActiveRecord::Base
  has_many :patients
end
