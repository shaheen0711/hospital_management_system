class RoomsController < ApplicationController
  before_filter :login_required
  filter_access_to :all  

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id]) 
  end
 
  def add_room
    @room = Room.create(params[:room])
    if @room.save
      flash[:notice] = "new room added."
      redirect_to rooms_path
    else
      render "add_room" 
       flash[:notice] = "room not added."
    end
  end

  def edit
    @room = Room.find(params[:id]) 
  end
  
  
  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      flash[:notice] = "Room details updated."
      redirect_to rooms_path
    else
      flash[:notice] = "Room details not updated."
      redirect_to  edit_room_path
    end
  end
  
  
  
  
  def room_detail
    @room = Room.find(params[:id])
  end
  
  def bed_list
    @beds = Bed.find_all_by_room_id(params[:id])
  end
  
  def create_bed
    @bed = Bed.new(params[:bed])
    if @bed.save
      flash[:notice] = "new bed added." 
      redirect_to bed_list_room_path
     
    else        
      render 'create_bed'
      flash[:notice] = "bed not added."
    end
  end
  
  def delete_room
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "one room deleted."
    redirect_to rooms_path
    
  end
  
  def delete_bed
    @bed = Bed.find(params[:id])
    @bed.destroy
    flash[:notice] = "one bed deleted."
    redirect_to rooms_path
  end
  def export_beds
    @beds = Room.find_beds
    beds_csv = FasterCSV.generate do |csv|
      # header row
      csv << ["Room no.", "Total beds", "Available beds" ,"Occupied beds"]
      # data rows
      @beds.each do |bed|
        csv << [bed.room_number, bed.total_beds, bed.available_beds, bed.Occupied_beds]
      end
    end
    send_data(beds_csv, :type => 'text/csv', :filename => 'rooms.csv')
  end
  
end
