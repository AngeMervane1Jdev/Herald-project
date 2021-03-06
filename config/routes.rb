Rails.application.routes.draw do


  resources :pmes
  

  get '/commencer-une-discussion/:category', to: 'discussions#create',as:"create_discussion" 

  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }

  devise_for :assistants, controllers:{
    registrations: 'assistants/registrations'
  }
  
  devise_for :administrateurs, controllers:{
    registrations: 'administrateurs/registrations'
  }
  root to: "home#index"

  get "/liste-des-discussions",to:"tableau#assistant", as:'assistant_dashboard'
  get "/mon-profile-utilisateur",to:"tableau#user", as:'user_dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :discussions do
    resources :commentaires
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  
end
  