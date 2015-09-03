Rails.application.routes.draw do
  resources :accounts, only: %i( create show )

  root to: 'top#index'
end
