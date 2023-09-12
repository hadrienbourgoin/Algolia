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

ActiveRecord::Schema[7.0].define(version: 2023_09_12_151841) do
  create_table "actors", force: :cascade do |t|
    t.string "fullname"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alternative_titles", force: :cascade do |t|
    t.string "alt_title"
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_alternative_titles_on_movie_id"
  end

  create_table "genre_movies", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genre_movies_on_genre_id"
    t.index ["movie_id"], name: "index_genre_movies_on_movie_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_actors", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "actor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_movie_actors_on_actor_id"
    t.index ["movie_id"], name: "index_movie_actors_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.string "image"
    t.string "color"
    t.float "score"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "alternative_titles", "movies"
  add_foreign_key "genre_movies", "genres"
  add_foreign_key "genre_movies", "movies"
  add_foreign_key "movie_actors", "actors"
  add_foreign_key "movie_actors", "movies"
end
