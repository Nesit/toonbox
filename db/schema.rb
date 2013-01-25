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

ActiveRecord::Schema.define(:version => 20130125114941) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "job_position_requests", :force => true do |t|
    t.integer  "job_position_id"
    t.string   "email"
    t.string   "state"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.text     "text"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "job_position_translations", :force => true do |t|
    t.integer  "job_position_id"
    t.string   "locale"
    t.string   "title"
    t.text     "short_description"
    t.text     "description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "job_position_translations", ["job_position_id"], :name => "index_job_position_translations_on_job_position_id"
  add_index "job_position_translations", ["locale"], :name => "index_job_position_translations_on_locale"

  create_table "job_positions", :force => true do |t|
    t.boolean  "open",       :default => true, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "movie_episode_translations", :force => true do |t|
    t.integer  "movie_episode_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "movie_episode_translations", ["locale"], :name => "index_movie_episode_translations_on_locale"
  add_index "movie_episode_translations", ["movie_episode_id"], :name => "index_movie_episode_translations_on_movie_episode_id"

  create_table "movie_episodes", :force => true do |t|
    t.integer  "movie_id",   :null => false
    t.text     "video_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "movie_images", :force => true do |t|
    t.string   "relation_type",      :null => false
    t.integer  "relation_id",        :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "default"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "movie_translations", :force => true do |t|
    t.integer  "movie_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.text     "awarded_text"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "movie_translations", ["locale"], :name => "index_movie_translations_on_locale"
  add_index "movie_translations", ["movie_id"], :name => "index_movie_translations_on_movie_id"

  create_table "movies", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "new_movie"
    t.boolean  "awarded"
  end

  create_table "partner_translations", :force => true do |t|
    t.integer  "partner_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "partner_translations", ["locale"], :name => "index_partner_translations_on_locale"
  add_index "partner_translations", ["partner_id"], :name => "index_partner_translations_on_partner_id"

  create_table "partners", :force => true do |t|
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "staff_translations", :force => true do |t|
    t.integer  "staff_id"
    t.string   "locale"
    t.string   "title"
    t.string   "job"
    t.text     "biography"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "staff_translations", ["locale"], :name => "index_staff_translations_on_locale"
  add_index "staff_translations", ["staff_id"], :name => "index_staff_translations_on_staff_id"

  create_table "staffs", :force => true do |t|
    t.text     "lj_url"
    t.text     "vk_url"
    t.text     "tw_url"
    t.integer  "position",           :default => 100, :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
