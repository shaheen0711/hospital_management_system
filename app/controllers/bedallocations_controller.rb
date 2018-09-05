class BedallocationsController < ApplicationController
  def index
    @bedallocations = Bedallocation.all(params[:id])
  end

  def show
    @bedallocation = Bedallocation.find(params[:id]) 
  end

  def new
    @bedallocation = Bedallocation.new
  end
  
  
  def create
    @bedallocation = Bedallocation.create(params[:bedallocation])
    if @bedallocation.save
      flash[:notice] = "Bed allocated." 
      redirect_to patients_path
     
    else  
      flash[:notice] = "bed not allocated."      
      render 'new'
      
    end
  end

  def beds_list
    #  @beds = Bed.find_all_by_room_id(params[:id], :include => :room)
    #  
    # @beds = Bed.find(:all , "SELECT id , bed_number from beds where beds.id not in 
    #(select bed_id from bedallocations where bedallocations.bed_id = beds.id) group by beds.id")")

    @beds = Bed.find_by_sql("SELECT beds.id, beds.bed_number from beds
inner join rooms ON
beds.room_id = rooms.id
where  room_id = #{(params[:id])} and beds.id not in (select bed_id from bedallocations where bedallocations.bed_id = beds.id) group by beds.id")

    #   @beds = Bed.find(params[:id], :condition => "SELECT id , bed_number from beds where beds.id not in (select bed_id from bedallocations where bedallocations.bed_id = beds.id) group by beds.id ", :include => :room)
    render :update do |page|
      page.replace_html "bedallocation_bed_id", :partial => "beds_list"
    end
  end
  
  
  
  
  
  
  
end
