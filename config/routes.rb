Rails.application.routes.draw do
  root to: 'members#index'
  resources :members
  resources :tasks do
    member do
      patch :update_status
    end
  end
end
