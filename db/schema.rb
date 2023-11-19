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

ActiveRecord::Schema[7.0].define(version: 2022_08_16_095642) do
  create_table "projects", force: :cascade do |t|
    t.text "name"
    t.float "version"
    t.integer "stage"
    t.text "description"
    t.text "introduction"
    t.text "main"
    t.text "results"
    t.text "currently"
    t.boolean "hidden"
    t.text "github_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "resources"
  end

  create_table "publications", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "body"
    t.text "resources"
    t.integer "stage"
    t.boolean "hidden"
    t.text "github_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.text "name"
    t.integer "count"
    t.text "project_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "publication_name"
  end

end
