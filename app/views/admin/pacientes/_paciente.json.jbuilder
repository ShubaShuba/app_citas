json.extract! paciente, :id, :nombre, :apellidos, :dni, :telefono, :direccion, :email, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
