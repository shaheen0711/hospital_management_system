# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
users = User.find_or_create_by_username(:first_name => 'Shaheen', :last_name => 'Khan', :username => 'shaheen@gmail.com' , :password => 'abc123', :user_type => 'Admin', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Zoya', :last_name => 'Khan', :username => 'zoya@gmail.com' , :password => 'abc111', :user_type => 'Doctor', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Sana', :last_name => 'Khan', :username => 'sana@gmail.com' , :password => 'abc222', :user_type => 'Patient', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Ram', :last_name => 'lal', :username => 'ram@gmail.com' , :password => 'abc333', :user_type => 'Doctor', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Sam', :last_name => 'lal', :username => 'sam@gmail.com' , :password => 'abc444', :user_type => 'Patient', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Sona', :last_name => 'Khan', :username => 'sona@gmail.com' , :password => 'abc555', :user_type => 'Patient', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Sham', :last_name => 'singh', :username => 's@gmail.com' , :password => 'abc123', :user_type => 'Patient', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Shubh', :last_name => 'singh', :username => 'sha@gmail.com' , :password => 'abc123', :user_type => 'doctor', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Sonam', :last_name => 'kapoor', :username => 'shahin@gmail.com' , :password => 'abc123', :user_type => 'patient', :is_blocked => false, :is_deleted => false)


users = User.find_or_create_by_username(:first_name => 'Rajesh', :last_name => 'Khana', :username => 'rajesh@gmail.com' , :password => 'abc555', :user_type => 'doctor', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Ravi', :last_name => 'singh', :username => 'ravi@gmail.com' , :password => 'abc123', :user_type => 'doctor', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Rani', :last_name => 'singh', :username => 'rani@gmail.com' , :password => 'abc123', :user_type => 'doctor', :is_blocked => false, :is_deleted => false)
users = User.find_or_create_by_username(:first_name => 'Arjun', :last_name => 'kapoor', :username => 'arjun@gmail.com' , :password => 'abc123', :user_type => 'doctor', :is_blocked => false, :is_deleted => false)



departments = Department.create(:department_name => 'Emergency_department')
departments = Department.create(:department_name => 'Gastroenterology')
departments = Department.create(:department_name => 'Elderly services department')

beds = Bed.create(:bed_number => "1", :description => "Abc" , :room_id => 6)
beds = Bed.create(:bed_number => "2", :description => "B" , :room_id => 6)
beds = Bed.create(:bed_number => "3", :description => "C" , :room_id => 6)



medicalrecords = Medicalrecord.create(:patient_id => "18", :doctor_observation => "fever , bp low, cold", :prescription => "aaaaa,aaa,dd,,ddd")
medicalrecords = Medicalrecord.create(:patient_id => "18", :doctor_observation => "fever , bp low, cold", :prescription => "aaaaa,aaa,dd,,ddd")

bloodgroups = BloodGroup.create(:name => "A+")
bloodgroups = BloodGroup.create(:name => "B+")
bloodgroups = BloodGroup.create(:name => "O+")
bloodgroups = BloodGroup.create(:name => "O-")
bloodgroups = BloodGroup.create(:name => "A-")
bloodgroups = BloodGroup.create(:name => "A+")
bloodgroups = BloodGroup.create(:name => "AB")





countries = Country.create(:name => "Algeria")
countries = Country.create(:name => "Argentina")
countries = Country.create(:name => "Brazil")
countries = Country.create(:name => "Bhutan")
countries = Country.create(:name => "Canada")
countries = Country.create(:name => "China")
countries = Country.create(:name => "Denmark")
countries = Country.create(:name => "Egypt")
countries = Country.create(:name => "France")
countries = Country.create(:name => "Germany")
countries = Country.create(:name => "Hungary")
countries = Country.create(:name => "Iceland")
countries = Country.create(:name => "India")
countries = Country.create(:name => "Japan")
countries = Country.create(:name => "Nepal")


