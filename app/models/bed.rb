class Bed < ActiveRecord::Base
  validates_presence_of  :room_id
  validates_presence_of  :bed_number

  belongs_to :room
  has_many   :bedallocations

end