
Rails.application.routes.draw do
  root "home#index"
  resources :pacientes
  resources :medicos
  resources :citas
end

