class MedicalrecordsController < ApplicationController
  
  def index
    @patient = Patient.find(params[:patient_id])
    @medicalrecords = @patient.medicalrecords
  end

  def show
    @patient = Patient.find(params[:patient_id])
    @medicalrecord = @patient.medicalrecords.find(params[:id])
  end
  
  def show_pdf
    @patient = Patient.find(params[:patient_id])
    @medicalrecord = @patient.medicalrecords.find(params[:id])
    render :pdf => "show_pdf.html.erb",
           :disposition => "attachment; filename='record.pdf'",
           :template => "medicalrecords/show_pdf.html.erb"
  end
  
  def new
    @patient = Patient.find(params[:patient_id])
    @medicalrecord = @patient.medicalrecords.build
  end
  
  def create
    @patient = Patient.find(params[:patient_id])
    @medicalrecord = @patient.medicalrecords.create(params[:medicalrecord])
    if @medicalrecord.save
      flash[:notice] = "new medical record added." 
      redirect_to patient_medicalrecords_path
    else
      flash[:notice] = "medical record not added." 
      render :action => "new"
    end 
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @medicalrecord = @patient.medicalrecords.find(params[:id])
  end
  
  def update
    @patient = Patient.find(params[:patient_id])
    @medicalrecord = Medicalrecord.find(params[:id])
    if @medicalrecord.update_attributes(params[:medicalrecord])
      redirect_to patient_medicalrecords_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @patient = Patient.find(params[:patient_id])
    @medicalrecord = Medicalrecord.find(params[:id])
    @medicalrecord.destroy
    respond_to do |format|
      format.html { redirect_to patient_medicalrecords_path(@patient) }
      format.xml  { head :ok }
    end
  end
end