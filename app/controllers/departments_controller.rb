class DepartmentsController < ApplicationController
  before_filter :login_required
  filter_access_to :all  

  def index
    @departments = Department.all
  end
  
  def department_detail
    @department = Department.find(params[:id])
  end
  
  def new
    @department = Department.new
  end
  
  def add_department
    @department = Department.create(params[:department])
    if @department.save
      flash[:notice] = "New Department added."
      redirect_to departments_path 
    else
      render "add_department"
    end
  end

  def show 
    @departments = Department.find(params[:id])
  end

  def edit
    @department = Department.find(params[:id])
  end
  
  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(params[:department])
      flash[:notice] = "Department details updated."
      redirect_to departments_path
    else
      flash[:notice] = "Department details  not updated."
      redirect_to edit_department_path
    end
  end
  
  def delete_department
    @department = Department.find(params[:id])
    if @department.destroy
      flash[:notice] = "Department deleted."
      redirect_to departments_path
    else
      flash[:notice] = "Department not deleted."
      render "delete_department"
    end
  end

  def doctor_detail
    @doctor = Doctor.find_by_department_id(params[:id])
  end
  
  def doctor_list
    @doctors = Doctor.find_all_by_department_id(params[:id])
  end

end
