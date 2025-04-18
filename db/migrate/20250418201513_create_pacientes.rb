class CreatePacientes < ActiveRecord::Migration[8.0]
  def change
    create_table :pacientes do |t|
      t.string :nombre
      t.string :apellidos
      t.string :dni
      t.string :telefono
      t.string :direccion
      t.string :email

      t.timestamps
    end
  end
end
