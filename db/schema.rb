# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_11_05_193524) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "patient_id"
    t.date "appointment_date"
    t.integer "slot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "department_id"
  end

  create_table "bedallocations", force: :cascade do |t|
    t.integer "room_id"
    t.integer "patient_id"
    t.integer "bed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beds", force: :cascade do |t|
    t.string "bed_number"
    t.text "description"
    t.integer "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["room_id"], name: "index_by_room_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "department_id"
    t.string "qualification"
    t.string "experience"
    t.string "nationality"
    t.date "date_of_birth"
    t.string "address"
    t.string "contact_number"
    t.string "email"
    t.string "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicalrecords", force: :cascade do |t|
    t.integer "patient_id"
    t.text "doctor_observation"
    t.text "prescription"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "user_id"
    t.date "date_of_birth"
    t.string "address"
    t.string "contact_number"
    t.string "email"
    t.string "gender"
    t.string "blood_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_number"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slots", force: :cascade do |t|
    t.integer "doctor_id"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "department_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "hashed_password"
    t.string "password_salt"
    t.string "user_type"
    t.boolean "is_blocked", default: false
    t.boolean "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
