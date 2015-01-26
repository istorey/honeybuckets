Rails.application.routes.draw do
  resources :users
  get "login" => "users#login"

  resources :locations, only: [:show, :new, :create] do
    resources :reviews, only: [:create, :update, :destroy]
  end

  get "map" => "locations#map"

  root "locations#home"
end