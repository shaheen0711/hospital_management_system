# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20180922170155) do

  create_table "appointments", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.date     "appointment_date"
    t.integer  "slot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  create_table "bed_allocations", :force => true do |t|
    t.integer  "room_id"
    t.integer  "patient_id"
    t.integer  "bed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bedallocations", :force => true do |t|
    t.integer  "room_id"
    t.integer  "patient_id"
    t.integer  "bed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beds", :force => true do |t|
    t.string   "bed_number"
    t.text     "description"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "beds", ["room_id"], :name => "index_by_room_id"

  create_table "blood_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bloodgroups", :force => true do |t|
    t.string   "type"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "department_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", :force => true do |t|
    t.integer  "user_id",        :null => false
    t.integer  "department_id"
    t.string   "qualification"
    t.string   "experience"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "contact_number"
    t.string   "email"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  create_table "madical_reports", :force => true do |t|
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_records", :force => true do |t|
    t.integer  "patient_id"
    t.text     "doctor_observation"
    t.text     "prescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicalrecords", :force => true do |t|
    t.integer  "patient_id"
    t.text     "doctor_observation"
    t.text     "prescription"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "patients", :force => true do |t|
    t.integer  "user_id"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "contact_number"
    t.string   "email"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blood_group_id"
  end

  create_table "rooms", :force => true do |t|
    t.string   "room_number"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slots", :force => true do |t|
    t.integer  "doctor_id"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "hashed_password"
    t.string   "password_salt"
    t.string   "user_type"
    t.boolean  "is_blocked",         :default => false
    t.boolean  "is_deleted",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
