authorization do

  role :guest do
    includes :register_patient
  end
  
	role :admin do
		includes :manage_rooms
		includes :manage_departments
		includes :manage_doctors
		includes :manage_patients
    includes :manage_users
    has_permission_on :patients, 
      :to => [:show_pdf]
   
	end

	role :doctor do
		includes :view_doctor
		includes :view_user
    includes :search 
    includes :manage_record
  
    has_permission_on :patients, 
      :to => [:patient_profile]
	end
	
	role :patient do
    includes :patient_details
		includes :view_records
    
    
	end
  
  
  role :patient_details do
    has_permission_on :patients, :to => [:index, :new, :download_pdf, :show_pdf, :medical_record, :book_appointment, :department_detail, :doctor_list, :doctor_detail]
  end

  role :register_patient do
    has_permission_on :patients, :to => [:new, :create]
  end
  
   role :manage_users do
    has_permission_on :users, :to => [:new, :index, :create]
  end
  
	role :manage_rooms do 
		has_permission_on :rooms, :to => [:index, :update, :bed_list, :delete_bed, :create_bed, :csv_report, :export_beds, :edit, :new  , :create , :show, :add_room, :delete_room, :room_detail]
	end

	role :manage_departments do
    has_permission_on :departments, :to => [:index,   :doctor_list, :add_department,:update,:doctor_detail, :show, :edit, :create, :new, :delete_department, :department_detail]
	end
	
	role :manage_doctors do
    has_permission_on :doctors, :to => [:index,  :new, :update, :create, :add_doctor, :show,  :delete, :doctor_detail, :edit, :destroy]	
	end
	
	role :manage_patients do
    has_permission_on :patients, :to => [:index, :create, :show, :show_pdf, :new_patient, :edit, :update, :delete_patient, :patient_detail, :destroy]	
	end

	role :view_doctor do
		has_permission_on :doctors, :to => [:show, :search, :create, :patient_detail]		
	end

  role :manage_record do
		has_permission_on :medicalrecords, :to => [:edit, :delete, :show]	
    has_permission_on :patients, :to => [:edit, :delete, :show]	
	end 
	role :view_records do
		has_permission_on :medicalrecords, :to => [:index]
		
	end

  role :search do
    has_permission_on :doctors, :to => [:search, :all_patient, :create]
  end
  
  role :all_patient  do
    has_permission_on :doctors, :to => [:search, :all_patient, :create]
  end
 
end



