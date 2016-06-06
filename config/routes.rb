Rails.application.routes.draw do

  resources :users
  resources :sessions
  resources :statuses
  resources :likes
  root 'welcome#index'



  get "/sign_in" => "sessions#new", as: "sign_in"
  get "/sign_up" => "users#new", as: "sign_up"
end
