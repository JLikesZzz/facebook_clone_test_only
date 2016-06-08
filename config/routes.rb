Rails.application.routes.draw do

  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :statuses
  resources :users do
    resources :statuses do
      resources :likes, only: [:create, :destroy]
    end
  end
  resources :likes
  root 'welcome#index'


  get "/sign_out" => "sessions#destroy", as: "signout"
  get "/sign_in" => "sessions#new", as: "sign_in"
  get "/sign_up" => "users#new", as: "sign_up"
end
