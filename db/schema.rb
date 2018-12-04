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

ActiveRecord::Schema.define(version: 2018_12_04_134646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followed_playlists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_followed_playlists_on_playlist_id"
    t.index ["user_id"], name: "index_followed_playlists_on_user_id"
  end

  create_table "movie_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_movie_categories_on_category_id"
    t.index ["movie_id"], name: "index_movie_categories_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "director"
    t.integer "release_date"
    t.text "syllabus"
    t.string "duration"
    t.string "actors"
    t.string "movie_url"
    t.integer "rating"
    t.integer "price"
    t.string "trailer_url"
    t.integer "number_rates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies_playlists", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movies_playlists_on_movie_id"
    t.index ["playlist_id"], name: "index_movies_playlists_on_playlist_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "playlist_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rate"
    t.text "comment"
    t.datetime "review_date"
    t.bigint "movie_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watchlist_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_watchlist_items_on_movie_id"
    t.index ["user_id"], name: "index_watchlist_items_on_user_id"
  end

  create_table "watchlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "followed_playlists", "playlists"
  add_foreign_key "followed_playlists", "users"
  add_foreign_key "movie_categories", "categories"
  add_foreign_key "movie_categories", "movies"
  add_foreign_key "movies_playlists", "movies"
  add_foreign_key "movies_playlists", "playlists"
  add_foreign_key "playlists", "users"
  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
  add_foreign_key "watchlist_items", "movies"
  add_foreign_key "watchlist_items", "users"
end
