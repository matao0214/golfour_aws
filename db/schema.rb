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

ActiveRecord::Schema.define(version: 2020_07_08_113555) do

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "training_post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_post_id", "user_id"], name: "index_likes_on_training_post_id_and_user_id", unique: true
    t.index ["training_post_id"], name: "index_likes_on_training_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "spots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address", limit: 50, null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.bigint "training_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_post_id"], name: "index_spots_on_training_post_id"
  end

  create_table "training_contents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "training_time", null: false
    t.integer "training_hits", null: false
    t.integer "training_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "training_impression", limit: 255
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "task_ball_dont_hits_club"
    t.string "task_slice"
    t.string "task_hook"
    t.string "task_ball_dont_fly_far"
    t.string "task_flight_distance_dont_change"
    t.string "task_get_duffed"
    t.string "task_other"
    t.index ["user_id"], name: "index_training_posts_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", limit: 10, null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "golf_reki"
    t.string "goal", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "likes", "training_posts"
  add_foreign_key "likes", "users"
  add_foreign_key "spots", "training_posts"
  add_foreign_key "training_posts", "users"
end
