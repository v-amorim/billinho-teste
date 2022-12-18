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

ActiveRecord::Schema[7.0].define(version: 2022_09_20_161303) do
  create_table "bills", force: :cascade do |t|
    t.integer "enrollment_id", null: false
    t.decimal "amount", null: false
    t.date "due_date", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enrollment_id"], name: "index_bills_on_enrollment_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "institution_id", null: false
    t.float "amount", null: false
    t.integer "installments", null: false
    t.integer "due_day", null: false
    t.string "course", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_enrollments_on_institution_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name", null: false
    t.string "cnpj", null: false
    t.string "i_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_institutions_on_cnpj", unique: true
    t.index ["name"], name: "index_institutions_on_name", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.date "birthday"
    t.string "payment_method", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_students_on_cpf", unique: true
    t.index ["name"], name: "index_students_on_name", unique: true
  end

  add_foreign_key "bills", "enrollments"
  add_foreign_key "enrollments", "institutions"
  add_foreign_key "enrollments", "students"
end
