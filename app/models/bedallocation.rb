class Bedallocation < ActiveRecord::Base
   validates_presence_of   	:room_id
validates_presence_of   	:bed_id
validates_presence_of   	:patient_id

  
  belongs_to 			:patient
belongs_to 		             :bed
end
