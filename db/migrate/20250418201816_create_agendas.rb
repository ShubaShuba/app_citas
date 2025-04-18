class CreateAgendas < ActiveRecord::Migration[8.0]
  def change
    create_table :agendas do |t|
      t.references :medico, null: false, foreign_key: true
      t.date :fecha
      t.time :hora_inicio
      t.time :hora_fin
      t.boolean :disponible

      t.timestamps
    end
  end
end
