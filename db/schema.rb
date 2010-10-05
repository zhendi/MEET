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

ActiveRecord::Schema.define(:version => 20101005041445) do

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.integer  "ding",       :default => 0
    t.integer  "cai",        :default => 0
    t.integer  "readcount",  :default => 0
    t.integer  "user_id",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 12
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string  "name",         :limit => 30
    t.integer "provinces_id"
  end

  create_table "collects", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "collected_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "email"
    t.string   "title"
    t.text     "memo"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "course_categories", :force => true do |t|
    t.string   "name"
    t.integer  "courses_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "gold"
    t.integer  "level_id",            :null => false
    t.integer  "category_id",         :null => false
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "priority",     :default => 0
    t.integer  "topics_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", :force => true do |t|
    t.string   "name",       :limit => 180
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name"
    t.string   "address"
    t.string   "mobile"
    t.string   "home_phone"
    t.integer  "age"
    t.boolean  "sex",                 :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "english_name"
    t.date     "birthday"
    t.string   "star"
    t.string   "home_province"
    t.string   "home_city"
    t.string   "english_level"
    t.string   "msn"
    t.string   "qq"
    t.string   "gmail"
    t.string   "blog"
    t.string   "homepage"
    t.string   "company"
    t.text     "company_description"
    t.string   "company_province"
    t.string   "company_city"
    t.string   "education_level"
    t.string   "school_name"
    t.integer  "income_year"
    t.text     "interest"
    t.text     "loved_music"
    t.text     "loved_movie"
    t.text     "loved_game"
    t.text     "loved_sport"
    t.text     "loved_person"
    t.text     "self_description"
  end

  create_table "provinces", :force => true do |t|
    t.string "name", :limit => 30
  end

  create_table "roles", :force => true do |t|
    t.string "name", :limit => 20
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "forum_id"
    t.integer  "forum_posts_count", :default => 0
    t.boolean  "stick",             :default => false
    t.integer  "ding",              :default => 0
    t.integer  "cai",               :default => 0
    t.integer  "gold"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "answers_count",     :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.string   "password_salt",                      :default => "", :null => false
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "blogs_count",                        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gold",                               :default => 0
    t.integer  "score",                              :default => 0
    t.integer  "role_id"
    t.integer  "answers",                            :default => 0
  end

end
