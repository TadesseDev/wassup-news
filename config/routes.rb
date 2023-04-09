require "sidekiq/web"
Rails.application.routes.draw do
  root "news#index"
  mount Sidekiq::Web => "/newsStack/sidekiq"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
