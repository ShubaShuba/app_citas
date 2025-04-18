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

ActiveRecord::Schema[8.0].define(version: 2025_04_18_201816) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "agendas", force: :cascade do |t|
    t.bigint "medico_id", null: false
    t.date "fecha"
    t.time "hora_inicio"
    t.time "hora_fin"
    t.boolean "disponible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medico_id"], name: "index_agendas_on_medico_id"
  end

  create_table "cita", force: :cascade do |t|
    t.bigint "paciente_id", null: false
    t.bigint "medico_id", null: false
    t.date "fecha"
    t.time "hora"
    t.text "motivo"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medico_id"], name: "index_cita_on_medico_id"
    t.index ["paciente_id"], name: "index_cita_on_paciente_id"
  end

  create_table "medicos", force: :cascade do |t|
    t.string "nombre"
    t.string "apellidos"
    t.string "especialidad"
    t.string "dni"
    t.string "telefono"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nombre"
    t.string "apellidos"
    t.string "dni"
    t.string "telefono"
    t.string "direccion"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agendas", "medicos"
  add_foreign_key "cita", "medicos"
  add_foreign_key "cita", "pacientes"
end
