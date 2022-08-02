Rails.application.routes.draw do
  devise_for :users
  resources :stations 
  resources :trains
  root "welcome#index"
end
