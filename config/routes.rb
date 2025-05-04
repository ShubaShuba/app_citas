Rails.application.routes.draw do
  resources :pacientes
  resources :medicos
  resources :citas
end
