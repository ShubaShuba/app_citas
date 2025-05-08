Rails.application.routes.draw do
  devise_for :users  

  root "home#index"

  resources :pacientes
  resources :medicos
  resources :citas
end
