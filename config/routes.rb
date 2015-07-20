Rails.application.routes.draw do
  resources :texts
  resources :inbounds
  resources :contacts do
    resources :texts
  end

  root to: 'texts#index'

end
