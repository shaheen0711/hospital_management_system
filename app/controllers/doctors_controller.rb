# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class DoctorsController < ApplicationController
  filter_access_to :all
  
  def index
    puts "trying to load this page"
  end
end
