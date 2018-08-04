class Patient < ActiveRecord::Base
validates_presence_of  :blood_group
validates_presence_of  :email
validates_presence_of  :date_of_birth
validates_presence_of  :address
validates_presence_of  :gender
validates_presence_of  :contact_number

belongs_to  :user
has_many  :medical_reports

end
