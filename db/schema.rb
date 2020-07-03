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

ActiveRecord::Schema.define(version: 2020_07_03_042108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: :cascade do |t|
    t.bigint "training_post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_post_id", "user_id"], name: "index_likes_on_training_post_id_and_user_id", unique: true
    t.index ["training_post_id"], name: "index_likes_on_training_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "address", limit: 50, null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.bigint "training_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_post_id"], name: "index_spots_on_training_post_id"
  end

  create_table "training_contents", force: :cascade do |t|
    t.integer "training_time"
    t.integer "training_hits"
    t.integer "training_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_posts", force: :cascade do |t|
    t.text "training_impression"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_training_posts_on_user_id"
  end

  create_table "training_tasks", force: :cascade do |t|
    t.integer "training_post_id", null: false
    t.integer "training_task_1"
    t.integer "training_task_2"
    t.integer "training_task_3"
    t.integer "training_task_4"
    t.integer "training_task_5"
    t.integer "training_task_6"
    t.integer "training_task_a"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "golf_reki"
    t.string "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "likes", "training_posts"
  add_foreign_key "likes", "users"
  add_foreign_key "spots", "training_posts"
  add_foreign_key "training_posts", "users"
end
