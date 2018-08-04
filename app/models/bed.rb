class Bed < ActiveRecord::Base
  belongs_to :room
  validates_presence_of  :bed_number

end
