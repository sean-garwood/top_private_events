Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :attendances, only: [ :create, :destroy ]
  end
  # Defines the root path route ("/")
  root "events#index"
end
