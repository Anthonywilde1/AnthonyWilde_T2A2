Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #my initial page that will have memes displayed on it
  resources :users, except:[:destroy, :new, :create] do 
    resources :memes, except:[:index, :destroy] do
      #eoufeaoivnioenveionjsev
      resources :comments, except: [:index, :show] 
  

    end
  end
  #success on stripe links
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  #needed to generate because comments r being deleted on meme page
  delete "/users/:user_id/memes/:id", to: "comments#destroy" , as: "delete_comment_path"
  #root page
  root "users#index" 
end
