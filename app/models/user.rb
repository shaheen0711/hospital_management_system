require 'digest'
class User < ActiveRecord::Base
  
  validates_presence_of  :first_name
  validates_presence_of  :last_name

  has_one  :patient, :dependent => :destroy 
  has_one  :doctor, :dependent => :destroy
 
  attr_accessor :password, :role
  before_create :set_password
  
  has_attached_file :photo, :styles => { :small => "150x150>" },
    :url  => "/assets/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  def set_password
    self.password_salt = random_string(8) if self.password_salt == nil
    self.hashed_password = Digest::SHA1.hexdigest(self.password_salt + self.password) unless self.password.nil?
  end
  
  def random_string(len)
    randstr = ""
    chars = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a
    len.times { randstr << chars[rand(chars.size - 1)] }
    randstr
  end
  
  def has_password?(submitted_password)
    hashed_password == encrypt(submitted_password)
  end
  

  def self.authenticate(login_info)
    user = User.find_by_username(login_info[:username])
    if(user && user.has_password?(login_info[:password]))
      return user
    else
      return nil
    end
  end
  
  def role_name
    case self.user_type.downcase
    when 'admin'
      return 'admin'
    when 'patient'
      return 'patient'
    when 'doctor'
      return 'doctor'
    else
      return nil
    end
    
  end
  
  def role_symbols
    prv = []
    case user_type.downcase
    when 'admin'
      prv = [:admin]
    when 'doctor'
      prv = [:doctor]
    when 'patient'
      prv = [:patient]
    else
      prv = prv
    end
    prv
  end
  
  private
  #private method to encrypt password using SHA1 Digest.
  def encrypt_password
    if(password.blank?)
      return
    else
      self.salt = make_salt(password) unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end
  end

  def encrypt(pwd)
    secure_hash(self.password_salt + pwd)
  end

  def secure_hash(str)
    Digest::SHA1.hexdigest(str)
  end

  def make_salt(str)
    secure_hash "#{Time.now.utc}#{str}"
  end

end
