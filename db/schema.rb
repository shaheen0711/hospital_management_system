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

ActiveRecord::Schema.define(:version => 20180802112151) do

  create_table "beds", :force => true do |t|
    t.string   "bed_number"
    t.text     "description"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "department_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "department_id"
    t.string   "qualification"
    t.string   "experience"
    t.string   "nationality"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "contact_number"
    t.string   "email"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "madical_reports", :force => true do |t|
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.integer  "user_id"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "contact_number"
    t.string   "email"
    t.string   "gender"
    t.string   "blood_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "room_number"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
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
