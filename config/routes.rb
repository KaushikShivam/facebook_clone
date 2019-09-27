Rails.application.routes.draw do
  resources :posts
  devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'login', edit: 'edit-user'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end
