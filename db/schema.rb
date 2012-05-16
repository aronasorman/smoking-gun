# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120516235459) do

  create_table "dats", :force => true do |t|
    t.integer  "student_id"
    t.integer  "verbal"
    t.integer  "numerical"
    t.integer  "abstract"
    t.integer  "mechanical"
    t.integer  "spacer_relation"
    t.integer  "spelling"
    t.integer  "language"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "followup_interviews", :force => true do |t|
    t.text     "comments"
    t.text     "planned_intervention"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "interview_id"
    t.integer  "nature_of_problem_type_id"
  end

  create_table "guardians", :force => true do |t|
    t.string   "name"
    t.string   "guardian_type"
    t.integer  "age"
    t.string   "occupation"
    t.string   "work_address"
    t.string   "telno"
    t.string   "celno"
    t.string   "email"
    t.string   "religion"
    t.integer  "student_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "is_living"
  end

  create_table "hspqs", :force => true do |t|
    t.integer  "student_id"
    t.integer  "A"
    t.integer  "B"
    t.integer  "C"
    t.integer  "D"
    t.integer  "E"
    t.integer  "G"
    t.integer  "Q2"
    t.integer  "Q3"
    t.integer  "Q4"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interview_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interviews", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "interview_type_id"
    t.integer  "period_id"
    t.integer  "user_id"
    t.integer  "student_id"
  end

  create_table "mpcls", :force => true do |t|
    t.integer  "student_id"
    t.integer  "HPD"
    t.integer  "FLE"
    t.integer  "SRA"
    t.integer  "CSM"
    t.integer  "SPR"
    t.integer  "PPR"
    t.integer  "MR"
    t.integer  "HF"
    t.integer  "FVE"
    t.integer  "ASW"
    t.integer  "CPT"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nature_of_problem_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "other_interviews", :force => true do |t|
    t.text     "content"
    t.integer  "interview_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "periods", :force => true do |t|
    t.integer  "num"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "routine_interviews", :force => true do |t|
    t.text     "general_mental_ability"
    t.text     "academic_history"
    t.integer  "interview_id"
    t.text     "family_relationship"
    t.text     "personal_emotional"
    t.text     "peer_relationship"
    t.text     "goals"
    t.text     "recommendation"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "schedule_entries", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "interview_type_id"
    t.integer  "period_id"
    t.integer  "user_id"
    t.integer  "student_id"
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "sshas", :force => true do |t|
    t.integer  "student_id"
    t.integer  "DA"
    t.integer  "WM"
    t.integer  "TA"
    t.integer  "EA"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.text     "picture"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.integer  "section_id"
    t.string   "nickname"
    t.string   "address"
    t.string   "telno"
    t.string   "celno"
    t.string   "email"
    t.date     "birthdate"
    t.string   "birthplace"
    t.text     "sibling_comments"
    t.text     "family_concerns"
    t.string   "most_significant_person"
    t.text     "why_significant"
    t.boolean  "is_special_guidance_needed"
    t.text     "special_guidance_elaboration"
    t.text     "work_experience"
    t.text     "interests"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "student_id"
    t.string   "religion"
    t.string   "citizenship"
    t.string   "grade_school"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "name"
    t.boolean  "is_head_counselor"
    t.boolean  "is_counselor"
    t.boolean  "is_secretary"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
