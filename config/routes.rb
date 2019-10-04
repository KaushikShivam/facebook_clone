Rails.application.routes.draw do
  resources :posts do
    resources :comments
    resources :likes
  end

  resources :users do
    get 'friend_requests', to: 'users#showrequests' 
    member do
      get :create_friendship
      get :update_friendship
      get :destroy_friendship
    end
  end

  devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'login', edit: 'edit-user'},
             :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  get 'users/show/:id', to: 'users#show'
  get 'users', to: 'users#index'
  
  authenticated :user do
    root to: 'posts#index'
  end
  
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  
end
