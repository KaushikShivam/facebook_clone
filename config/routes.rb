Rails.application.routes.draw do
  resources :posts
  devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'login', edit: 'edit-user'}
  
  # authenticated :user do
  #   root to: 'posts#index'
  # end
  
  
  get 'users/show/:id', to: 'users#show'
  get 'users', to: 'users#index'
  
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  authenticated :user do
    root to: 'posts#index'
  end
end
