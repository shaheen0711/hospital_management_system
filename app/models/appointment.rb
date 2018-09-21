class Appointment < ActiveRecord::Base
validates_presence_of     :doctor_id
validates_presence_of     :patient_id
validates_presence_of     :slot_id
validates_presence_of     :appointment_date
belongs_to   :department
belongs_to 	:doctor
belongs_to  :patient
belongs_to  :slot
end
