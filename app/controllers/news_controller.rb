class NewsController < ApplicationController
  def index
    query_params = { apiKey: ENV["NEWS_API_KEY"], country: "us" }
    LoadNewsJob.perform_async(
      "https://newsapi.org/v2/top-headlines?#{query_params.to_query}"
    )
    console
  end
end
