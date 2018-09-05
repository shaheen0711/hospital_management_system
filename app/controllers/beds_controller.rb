class BedsController < ApplicationController
  
  def index
    @beds = Bed.all(:include => :room)
  end

  def show
    @bed = Bed.find(params[:id])
  end

  def new
    @bed = Bed.new
  end
  
  def edit
    @bed = Bed.find(params[:id])
  end
  
  def create_bed
    @bed = Bed.new(params[:bed])
    if @bed.save
      flash[:notice] = "new bed added." 
      redirect_to rooms_path
    else    
      render 'new'
    end
  end
  
  def delete_bed
    @bed = Bed.find(params[:id])
    @bed.destroy
     flash[:notice] = "bed deleted." 
    redirect_to beds_path
  
  end
  
  def update
    @bed = Bed.find(params[:id])
    if @bed.update_attributes(params[:bed])
      flash[:notice] = "Bed details updated."
      redirect_to rooms_path
    else
      flash[:notice] = "Bed details not updated."
      redirect_to edit_bed_path
    end
  end

end
