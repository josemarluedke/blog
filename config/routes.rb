Blog::Application.routes.draw do
  resources :posts, only: [:index, :show]

  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => 'posts#index'
end
