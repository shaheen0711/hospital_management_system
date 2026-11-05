class AppointmentsController < ApplicationController
  
  def index
    @appointments = Appointment.all(:include => [:patient, :doctor, :department, :slot])
  end
  
  def create
    @appointment = Appointment.new(appointment_params)
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
      #   :disposition => "attachment; filename='filename.pdf'",
    #   :layout => false,
    #   :margin => {:top => 0, :bottom => 0, :right => 0, :left => 0},
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
    booked_slot_ids = Appointment.where(
      doctor_id: params[:id],
      appointment_date: params[:date]
    ).select(:slot_id)
    @slots = Slot.where(doctor_id: params[:id])
                 .where.not(id: booked_slot_ids)
                 .select(:id, :start_time, :end_time)
      render :update do |page|
        page.replace_html "appointment_slot_id"  , :partial => "slot_list"
      end
    end

  private

  def appointment_params
    params.require(:appointment).permit(
      :doctor_id, :patient_id, :department_id, :slot_id, :appointment_date,
      :"appointment_date(1i)", :"appointment_date(2i)", :"appointment_date(3i)"
    )
  end
end
