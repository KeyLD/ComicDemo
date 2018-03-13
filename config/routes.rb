Rails.application.routes.draw do

  devise_for :users
  resources :comics do
    resources :comments
  end
  resources :types
  resources :countries
  resources :themes
  # resources :countries
  root :to => "comics#index"
  # root :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
