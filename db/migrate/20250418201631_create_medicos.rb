class CreateMedicos < ActiveRecord::Migration[8.0]
  def change
    create_table :medicos do |t|
      t.string :nombre
      t.string :apellidos
      t.string :especialidad
      t.string :dni
      t.string :telefono
      t.string :email

      t.timestamps
    end
  end
end
