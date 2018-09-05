class SlotsController < ApplicationController
  
  def index
    @slot = Slot.all
  end

  def show
    @slots = Slot.find(params[:id])
  end

  
  def new
    @slot = Slot.new
  end
  
  
  def create
     @slot = Slot.new(params[:slot])
    if @slot.save
      redirect_to @slot
      flash[:notice] = "New Slot created." 
    else        
      render 'new'
      flash[:notice] = "Slot not created"
    end
  end
  
  
  def doctor_list
    @doctors = Doctor.find_all_by_department_id(params[:id], :include => :user)
    render :update do |page|
      page.replace_html "slot_doctor_id", :partial => "doctor_list"
    end
  end
end



