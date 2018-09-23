ActionController::Routing::Routes.draw do |map|
  
  map.resources :users,
    :collection => { :signup => [:get,:post], :login => [:get, :post], 
    :logout => [:get] , :admin_profile => [:get, :post] }
 
  map.resources :doctors,
    :member => {:doctor_detail => [:get, :post], :patient_detail => [:get, :post]},
    :collection => { :add_doctor => [:get, :post], :edit => [:get, :post], 
    :search => [:get, :post], :all_patient => [:get, :post]} 
  
  map.resources :patients, :has_many => :medicalrecords,
    :member => {:patient_profile => [:post , :get], :patient_detail => [:post , :get], :department_detail => [:get, :post], :download_pdf => [:get],
    :slots_list => [:get, :post], :doctor_list => [:get, :post],
    :doctor_detail => [:get, :post], :show_pdf => [:get]},
    :collection => { :new_patient => [:get, :post], :edit_patient => [:get, :post], 
      :medical_record => [:get, :post], :book_appointment => [:get, :post]}
    
  map.resources :departments,
    :member => {:department_detail => [:get, :post], :doctor_list => [:get, :post], :doctor_detail => [:get, :post]},
    :collection => { :add_department => [:get, :post] , :delete_department => [:get, :post]}
  
  map.resources :rooms, 
    :member => {:room_detail => [:get, :post], :bed_list => [:get, :post], :create_bed => [:get, :post]},
    :collection => { :add_room => [:get, :post], :csv_report => [:get, :post]}
  
  map.resources :beds, 
    :collection => {:add_bed => [:get, :post], :room_detail => [:get, :post], :create_bed => [:get, :post]}
  
  map.resources :slots, 
    :member => {:create_slot => [:get, :post]}
  map.resources :appointments, 
      :member => {:show_pdf => [:get]},
      :collection => {:doctor_list => [:get, :post], :slots_list => [:get, :post], :history => [:get, :post]}
  
  map.resources :medicalrecords, :member => {:show_pdf => [:get], :download_pdf => [:get]}
  
  map.resources :bedallocations 
  map.connect '/rooms/export', :controller => 'rooms', :action => 'export'
  ##, :member => {:create_bed => [:get, :post]}
  #  map.users '/users', :controller => 'users', :action => 'sing_up'
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
 
  map.root :controller => "users", :action => "login"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
