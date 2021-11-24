Rails.application.routes.draw do
  devise_for :administrateurs
  devise_for :assistants
  resources :commentaires
  resources :pmes
  
  devise_for :users
  root to:"home#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  