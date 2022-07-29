Rails.application.routes.draw do
  resources :stations 
  resources :trains
  root "welcome#index"
end
