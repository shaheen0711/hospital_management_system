# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
users = User.find_or_create_by_username(:first_name => 'Shaheen', :last_name => 'Khan', :username => 'shaheen@gmail.com' , :password => 'abc123', :user_type => 'Admin', :is_blocked => false, :is_deleted => false)
