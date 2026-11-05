Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users do
    collection do
      get :login
      post :login
      get :logout
      get :signup
      post :signup
      get :admin_profile
      post :admin_profile
      get :change_password
      post :change_password
    end
  end

  resources :patients do
    member do
      get :patient_profile
      post :patient_profile
      get :patient_detail
      post :patient_detail
      get :department_detail
      post :department_detail
      get :download_pdf
      get :slots_list
      post :slots_list
      get :doctor_list
      post :doctor_list
      get :doctor_detail
      post :doctor_detail
      get :show_pdf
    end
    collection do
      get :new_patient, action: :new
      post :new_patient, action: :create
      get :edit_patient
      post :edit_patient
      get :medical_record
      post :medical_record
      get :book_appointment
      post :book_appointment
    end
  end

  resources :departments do
    member do
      get :department_detail
      post :department_detail
      get :doctor_list
      post :doctor_list
      get :doctor_detail
      post :doctor_detail
    end
    collection do
      get :add_department
      post :add_department
      get :delete_department
      post :delete_department
    end
  end

  resources :rooms do
    member do
      get :room_detail
      post :room_detail
      get :bed_list
      post :bed_list
      get :create_bed
      post :create_bed
    end
    collection do
      get :add_room
      post :add_room
      get :csv_report
      post :csv_report
      get :export
    end
  end

  resources :beds do
    collection do
      get :add_bed
      post :add_bed
      get :room_detail
      post :room_detail
      get :create_bed
      post :create_bed
    end
  end

  resources :slots do
    member do
      get :create_slot
      post :create_slot
    end
  end

  resources :appointments do
    member do
      get :show_pdf
    end
    collection do
      get :doctor_list
      post :doctor_list
      get :slots_list
      post :slots_list
    end
  end

  resources :medicalrecords do
    member do
      get :show_pdf
      get :download_pdf
    end
  end

  resources :bedallocations

  root to: "users#login"
end
