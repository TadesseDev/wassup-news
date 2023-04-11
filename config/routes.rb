require "sidekiq/web"
Rails.application.routes.draw do
  root "news#index"
  post "search", to: "news#query_search"
  post "next-page", to: "news#next_page"
  get "channel-id", to: "news#channel_id"
  mount Sidekiq::Web => "/newsStack/sidekiq"
end
