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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151209145809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "countries", ["slug"], name: "index_countries_on_slug", using: :btree

  create_table "country_translations", force: :cascade do |t|
    t.integer  "country_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "country_translations", ["country_id"], name: "index_country_translations_on_country_id", using: :btree
  add_index "country_translations", ["locale"], name: "index_country_translations_on_locale", using: :btree

  create_table "course_translations", force: :cascade do |t|
    t.integer  "course_id",   null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
  end

  add_index "course_translations", ["course_id"], name: "index_course_translations_on_course_id", using: :btree
  add_index "course_translations", ["locale"], name: "index_course_translations_on_locale", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "slug"
    t.integer  "university_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "courses", ["slug"], name: "index_courses_on_slug", using: :btree
  add_index "courses", ["university_id"], name: "index_courses_on_university_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "page_region_translations", force: :cascade do |t|
    t.integer  "page_region_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "content"
  end

  add_index "page_region_translations", ["locale"], name: "index_page_region_translations_on_locale", using: :btree
  add_index "page_region_translations", ["page_region_id"], name: "index_page_region_translations_on_page_region_id", using: :btree

  create_table "page_regions", force: :cascade do |t|
    t.string   "controller"
    t.string   "action"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "page_regions", ["action"], name: "index_page_regions_on_action", using: :btree
  add_index "page_regions", ["controller"], name: "index_page_regions_on_controller", using: :btree
  add_index "page_regions", ["name"], name: "index_page_regions_on_name", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "slug"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "universities", ["country_id"], name: "index_universities_on_country_id", using: :btree
  add_index "universities", ["slug"], name: "index_universities_on_slug", using: :btree

  create_table "university_translations", force: :cascade do |t|
    t.integer  "university_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.text     "description"
  end

  add_index "university_translations", ["locale"], name: "index_university_translations_on_locale", using: :btree
  add_index "university_translations", ["university_id"], name: "index_university_translations_on_university_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
