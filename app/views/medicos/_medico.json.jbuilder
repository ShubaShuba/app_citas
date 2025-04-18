json.extract! medico, :id, :nombre, :apellidos, :especialidad, :dni, :telefono, :email, :created_at, :updated_at
json.url medico_url(medico, format: :json)
