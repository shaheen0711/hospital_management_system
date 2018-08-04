class Doctor < ActiveRecord::Base
validates_presence_of  :address	
validates_presence_of  :contact_number
validates_presence_of  :date_of_birth
validates_presence_of  :email
validates_presence_of  :gender
validates_presence_of  :nationality
validates_presence_of  :qualification

belongs_to  :user
belongs_to 	:department 

  
  
end
