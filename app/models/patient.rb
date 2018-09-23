class Patient < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :user_id, :photo
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates_presence_of  :blood_group
  validates_presence_of  :email,  :format => :VALID_EMAIL_REGEX
  validates_presence_of  :date_of_birth
  validates_presence_of  :address
  validates_presence_of  :gender
  validates_presence_of  :contact_number
  validates_presence_of  :first_name
  validates_presence_of  :last_name

  belongs_to :user
  has_many   :appointments
  has_many  :medicalrecords
  has_one   :bedallocation
  belongs_to   :blood_group

  before_update :update_user
  before_destroy :delete_user 
  before_create :add_user
  
  def add_user
    user = User.new
    user.first_name = self.first_name
    user.last_name = self.last_name
    user.user_type = 'Patient'
    user.password = 'patient123'
    user.username = self.first_name+self.last_name+"123"
    user.photo = self.photo
    user.save
    self.user = user unless user.new_record?
  end
  
end

def delete_user
  user.delete
end

def update_user  
  user.first_name = self.first_name
  user.last_name = self.last_name
  user.save   
end