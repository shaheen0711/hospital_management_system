class Room < ActiveRecord::Base 
validates_presence_of  :room_number
has_many 	:beds
end
