class DoctorsController < ApplicationController
  before_filter :login_required
  filter_access_to :all  

  def index
    @doctors = Doctor.all(:include => [:user, :country])
  end
  
  def new
    @doctor = Doctor.new
  end
  
  def create
    @doctor = Doctor.new(params[:doctor])
    if @doctor.save
      flash[:notice] = "Doctor detail added." 
      redirect_to @doctor
    else 
      flash[:notice] = "Doctor detail Not added."
      render 'new'
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end
  
  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update_attributes(params[:doctor])
      flash[:notice] = "Doctor details updated."
      redirect_to doctors_path
    else
      flash[:notice] = "Doctor details  not updated."
      redirect_to edit_doctor_path
    end  
  end
  
  def show
    @doctor = Doctor.find(params[:id])
  end
  
  def doctor_detail
    @doctor = Doctor.find(params[:id])
  end

  def search
    @patients = Patient.find(params[:id])
  end
  
  def all_patient
    @patients = Appointment.find_by_sql("select patient_id from appointments where
                                        doctor_id = #{@current_user.doctor.id} 
                                        group by patient_id")
  end

  def patient_detail
    @patient = Patient.find(params[:id])
  end
  
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.delete
    flash[:notice] = "One Doctor record deleted"
    redirect_to doctors_path
  end

end
