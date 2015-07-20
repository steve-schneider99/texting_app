Rails.application.routes.draw do
  resources :texts
  root to: 'texts#index'
end
