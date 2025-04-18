json.extract! agenda, :id, :medico_id, :fecha, :hora_inicio, :hora_fin, :disponible, :created_at, :updated_at
json.url agenda_url(agenda, format: :json)
