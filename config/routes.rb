Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #my initial page that will have memes displayed on it
  resources :users, except:[:destroy, :new, :create] do 
    resources :memes, except:[:index] do
      resources :comments, except: [:index, :show] 
  

    end
  end
  root "users#index" 
end
