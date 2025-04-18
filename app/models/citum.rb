class Citum < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico
  belongs_to :consultorio
end
