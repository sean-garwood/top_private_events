Rails.application.routes.draw do
  get "pets/new"
  get "pets/create"
  get "pets/destroy"
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  devise_for :users
  resources :pets
  resources :users, only: [ :show ]
  resources :events do
    resources :attendances, only: [ :create, :destroy ]
  end

  root "events#index"
end
