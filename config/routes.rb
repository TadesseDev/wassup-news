require "sidekiq/web"
Rails.application.routes.draw do
  root "news#index"
  post "search", to: "news#query_search"
  get "channel-id", to: "news#channel_id"
  mount Sidekiq::Web => "/newsStack/sidekiq"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
