Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'students#index'
  get 'students/import'
  resources :students do
    collection {post :import}
  end
end
