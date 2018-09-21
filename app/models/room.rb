class Room < ActiveRecord::Base 
validates_presence_of  :room_number
has_many 	:beds , :dependent => :destroy 

  def self.find_beds
  find_by_sql("select rooms.room_number , count(beds.bed_number) as total_beds ,  (select COUNT(beds.id) from beds where beds.room_id = rooms.id AND beds.id  not in (select bed_id from bedallocations) ) as available_beds, (select COUNT(beds.id) from beds where beds.room_id = rooms.id AND beds.id  in (select bed_id from bedallocations) ) as Occupied_beds  from beds 
inner join rooms on 
beds.room_id=rooms.id 

GROUP BY rooms.id")
end
  
  
  
end
