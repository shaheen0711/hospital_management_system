class Department < ActiveRecord::Base
  validates_presence_of  :department_name
  has_many  :doctors
  has_many :appointments
end
