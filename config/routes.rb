Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #my initial page that will have memes displayed on it
  resources :users, except:[:destroy, :new, :create]
  #root "users#index" 
  #get "users/:id", to: "users#show"
  #get "users/:id/edit", to: "users#edit"
  #patch "users/:id", to: "users#update"
end
