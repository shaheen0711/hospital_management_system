Gretel::Crumbs.layout do

  crumb :root do
    link "Home", {:controller => "users", :action => "index"}
  end
  
   crumb :patients_new do
    link "Patients", {:controller => "patients", :action => "new"}
    parent :root
  end
  
   crumb :users_admin_profile do
    link "Profile", {:controller => "users", :action => "admin_profile"}
    parent :root
  end
  
  crumb :departments_index do
    link "Department", {:controller => "departments", :action => "index"}
    parent :root
  end
 
  crumb :departments_add_department do
    link "Add department", {:controller => "departments", :action => "add_department"}
    parent :departments_index
  end
  
  crumb :departments_edit do
    link "Edit department", {:controller => "departments", :action => "edit"}
    parent :departments_index
  end
  
  crumb :departments_department_detail do
    link "Department detail", {:controller => "departments", :action => "department_detail"}
    parent :departments_index
  end
  
  
  crumb :departments_doctor_list do
    link "Doctors", {:controller => "departments", :action => "doctor_list"}
    parent :departments_department_detail
  end
  
  crumb :departments_doctor_detail do 
    link "Doctor Profile", {:controller => "departments", :action => "doctor_detail"}
    parent :departments_doctor_list
  end
  
  crumb :rooms_index do
    link "Rooms", {:controller => "rooms", :action => "index"}
    parent :root
  end
  
  crumb :rooms_add_room do
    link "Add room", {:controller => "rooms", :action => "add_room"}
    parent :rooms_index
  end
  
  crumb :rooms_edit do
    link "Edit room", {:controller => "rooms", :action => "edit"}
    parent :rooms_index
  end
  
    crumb :rooms_room_detail do
    link "Room detail", {:controller => "rooms", :action => "room_detail"}
    parent :rooms_index
  end
  
  crumb :rooms_bed_list do
    link "Beds", {:controller => "rooms", :action => "bed_list"}
    parent :rooms_room_detail
  end
  
   crumb :rooms_csv_report do
    link "Beds", {:controller => "rooms", :action => "csv_report"}
    parent :rooms_index
  end
  crumb :beds_index do
    link "Beds", {:controller => "beds", :action => "index"}
    parent :rooms_index
  end
  
  crumb :beds_create_bed do
    link "Add bed", {:controller => "beds", :action => "create_bed"}
    parent :rooms_index
  end
  
  crumb :beds_edit do
    link "Edit bed", {:controller => "beds", :action => "edit"}
    parent :beds_index
  end
  
  
   crumb :doctors_index do
    link "Doctors", {:controller => "doctors", :action => "index"}
    parent :root
  end
  
  crumb :doctors_new do
    link "New Doctor", {:controller => "doctors", :action => "new"}
    parent :doctors_index
  end
  
  
  crumb :doctors_edit do
    link "Edit Doctor", {:controller => "doctors", :action => "edit"}
    parent :doctors_index
  end
  
  crumb :doctors_doctor_detail do
    link "Doctor profile", {:controller => "doctors", :action => "doctor_detail"}
    parent :doctors_index
  end
  crumb :doctors_create do
    link "New slot", {:controller => "doctors", :action => "create"}
    parent :doctors_index
  end
   
  crumb :doctors_show do
    link "Doctor profile", {:controller => "doctors", :action => "show"}
    parent :doctors_index
  end
  
  
  crumb :slots_new do
    link "New slot", {:controller => "slots", :action => "new"}
    parent :doctors_index
  end
  
   crumb :slots_create do
    link "New slot", {:controller => "slots", :action => "create"}
    parent :doctors_index
  end
  
   crumb :slots_show do
    link "Slot", {:controller => "slots", :action => "show"}
    parent :doctors_index
  end
  
   crumb :patients_index do
    link "Patients", {:controller => "patients", :action => "index"}
    parent :root
  end
  
  
  crumb :patients_edit do
    link "Edit Patient", {:controller => "patients", :action => "edit"}
    parent :patients_index
  end
  #crumb :student_profile do |student|
  #    link student.full_name, {:controller=>"student",:action=>"profile",:id=>student.id}
  #    parent :student_index
  #  end
  crumb :patients_patient_detail do 
    link "Patient profile", {:controller => "patients", :action => "patient_detail"}
    parent :patients_index
  end
  
  crumb :patients_patient_profile do |patient|
    link "Patient profile", {:controller => "patients", :action => "patient_profile", :id => patient.id}
    parent :doctors_all_patient 
  end
  
  crumb :doctors_all_patient do 
    link "Patients", {:controller => "doctors", :action => "all_patient"}
    parent :root
  end
  
  
  
  
  crumb :medicalrecords_index do |patient|
    link "Patient history", {:controller => "medicalrecords", :action => "index"}
    parent :patients_patient_profile, patient
  end
  
   crumb :medicalrecords_new do |patient|
    link "add patient record", {:controller => "medicalrecords", :action => "new"}
    parent  :medicalrecords_index, patient
  end
   
  crumb :medicalrecords_edit do |patient|
    link "edit patient record", {:controller => "medicalrecords", :action => "edit"}
    parent  :medicalrecords_index, patient
  end
  
   crumb :medicalrecords_show do
    link "patient record", {:controller => "medicalrecords", :action => "show"}
    parent  :medicalrecords_index
  end
  
  
   crumb :appointments_new do
    link "Booking", {:controller => "appointments", :action => "new"}
    parent :root
  end
  
   crumb :appointments_create do
    link "New slot", {:controller => "appointments", :action => "create"}
    parent :root
  end
  
  
   crumb :appointments_show do
    link "Booking detail", {:controller => "appointments", :action => "show"}
    parent :appointments_new
  end
  
  crumb :appointments_show_pdf do
    link "Booking detail", {:controller => "appointments", :action => "show_pdf"}
    parent :appointments_new
  end
  
  crumb :patients_medical_record do
    link "Patients", {:controller => "patients", :action => "medical_record"}
    parent :root
  end
  
  crumb :bedallocations_new do
    link "bed allocation", {:controller => "bedallocations", :action => "new"}
    parent :patients_index
  end
  
  crumb :bedallocations_create do
    link "New slot", {:controller => "bedallocations", :action => "create"}
    parent :patients_index
  end
  #  crumb :student_profile do |student|
  #    link student.full_name, {:controller=>"student",:action=>"profile",:id=>student.id}
  #    parent :student_index
  #  end

  #  crumb :student_reports do |student|
  #    link I18n.t('report_center'), {:controller => "student", :action => "reports", :id => student.id}
  #    parent :student_profile, student
  #  end
  

end