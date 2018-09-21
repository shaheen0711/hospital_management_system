class PatientsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  filter_access_to :all, :except => [:new, :create]

  def index
    @patients = Patient.all(:include => :user)
  end

  def show
    @patient = Patient.find(params[:id])
  end
  
  def show_pdf
    @patient = Patient.find(params[:id])
    render :pdf => "show_pdf.html.erb",
      :disposition => "attachment; filename='filename.pdf'"
  end
  
  def edit
    @patient = Patient.find(params[:id])
  end
  
  def new
    @patient = Patient.new
  end
  
  def create
    if request.post?
      @patient = Patient.new(params[:patient])
      if @patient.save   
        redirect_to login_users_path
        flash[:notice] = "Welcome, Your account is created, you can login now"
      else    
        render 'new'  
        flash[:notice] = "Some thing went worng, Your account is not created ."
      end
    else
      render 'new'
    end
  end
  
  def medical_record
    @patient = Patient.find(@current_user.patient.id)
    @medicalrecords = @patient.medicalrecords
  end

  def book_appointment
    @departments = Department.all
  end
  
  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(params[:patient])
      flash[:notice] = "Patient details updated."
      redirect_to patients_path
    else
      flash[:notice] = "Patient details not updated."
      redirect_to edit_patient_path
    end
  end
  
  def download_pdf
    redner :pdf =>  "#{Rails.root}/public/images/rails.png", 
      :disposition => "attachment; filename='filename.pdf'",
      :type =>  "application/pdf",
      :x_sendfile => true
  end
  
  def doctor_list
    @doctors = Doctor.find_all_by_department_id(params[:id])
  end
  
  def department_detail
    @department = Department.find(params[:id])
  end
  def patient_detail
    @patient = Patient.find(params[:id])
  end
   
  def patient_profile
    @patient = Patient.find(params[:id])
  end
  
  def doctor_detail
    @doctor = Doctor.find(params[:id])
  end
  
  def destroy
    @patient = Patient.find(params[:id])
    @patient.delete
    redirect_to patients_path
  end

end
