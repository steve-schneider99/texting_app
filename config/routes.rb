Rails.application.routes.draw do
  resources :texts
  resources :contacts
  root to: 'texts#index'
end
