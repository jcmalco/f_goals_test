Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :family_goals do
    collection { post :import }
  end
  resources :users
  root to: 'family_goals#index'
end
