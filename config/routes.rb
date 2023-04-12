require "sidekiq/web"
Rails.application.routes.draw do
  get 'user/register'
  get 'user/subscribe'
  root "news#index"
  post "search", to: "news#query_search"
  post "next-page", to: "news#next_page"
  get "channel-id", to: "news#channel_id"
  match "subscribe-to-news-stream" => "news#subscribe_to_news_stream",
        :via => %i[get post]
  # post "subscribe-to-news-stream", to: "news#subscribe_to _news_stream"
  mount Sidekiq::Web => "/newsStack/sidekiq"
end
