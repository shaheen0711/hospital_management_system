class AppointmentsController < ApplicationController
  
  def index
    @appointments = Appointment.all(:include => [:patient, :doctor, :department, :slot])
  end
  
  def create
    @appointment = Appointment.new(params[:appointment])
    if @appointment.save
      redirect_to @appointment
      flash[:notice] = "Appointment booked." 
    else        
      render 'new'
      flash[:notice] = "your appointment is not booked please try again."
    end
  end
  
  def new
    @appointment = Appointment.new
    @doctors = []
  end
  
  def show
    @appointment = Appointment.find(params[:id])
  end
  
  def show_pdf
    @appointment = Appointment.find(params[:id])
    render :pdf => "show_pdf.html.erb",
      :template => "appointments/show_pdf.html.erb",
      :show_as_html => (params[:debug].present? && params[:debug].to_i == 1)
  end
  
  def doctor_list
    @doctors = Doctor.find_all_by_department_id(params[:id], :include => :user)
    render :update do |page|
      page.replace_html "appointment_doctor_id", :partial => "doctor_list"
    end
  end
  
  def slots_list
    @slots = Slot.find_by_sql("SELECT slots.id, slots.start_time, slots.end_time from slots
                                inner join doctors ON
                                doctors.id = slots.doctor_id
                                where doctor_id = #{(params[:id])}  
                                and slots.id not in 
                                (select slot_id from appointments 
                                where doctor_id = #{(params[:id])} 
                                and appointment_date = '#{(params[:date])}')
                                group by slots.id")
    render :update do |page|
      page.replace_html "appointment_slot_id"  , :partial => "slot_list"
    end
  end
end
