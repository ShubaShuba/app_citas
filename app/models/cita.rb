class Cita < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico
end
