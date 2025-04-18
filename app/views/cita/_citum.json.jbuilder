json.extract! citum, :id, :paciente_id, :medico_id, :consultorio_id, :fecha, :hora, :motivo, :estado, :created_at, :updated_at
json.url citum_url(citum, format: :json)
