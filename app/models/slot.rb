class Slot < ActiveRecord::Base 
validates_presence_of    :doctor_id
validates_presence_of    :start_time
validates_presence_of    :end_time

belongs_to   :doctor
has_many    :appointments

end
