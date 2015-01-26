Rails.application.routes.draw do
  resources :users
  get "login" => "users#login"

  resources :locations, only: [:show, :new, :create] do
    resources :reviews, only: [:create, :update, :destroy]
  end

  match "/auth/:provider/callback" => "sessions#create", via: [:get]

  get "map" => "locations#map"

  root "locations#home"
end
