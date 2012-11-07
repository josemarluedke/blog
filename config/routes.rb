Blog::Application.routes.draw do
  resources :posts, only: [:index, :show]

  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => 'posts#index'

  get '/feed', to: 'posts#index', format: :rss, as: :feed

  # Category (have to be in the end of file)
  get '/:category', to: 'posts#index', as: :category
end
