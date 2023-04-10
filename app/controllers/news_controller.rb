class NewsController < ApplicationController
  def index
    query_params = {
      apiKey: ENV["NEWS_API_KEY"],
      country: @country || "us", # this is a required field in the query params
      page: @page,
      pageSize: @pageSize,
      q: @keyWord,
      category: @category
    }
    query_params.compact!
    url = "https://newsapi.org/v2/top-headlines?#{query_params.to_query}"
    # LoadNewsJob.perform_async(url, query_params[:category])
    # console
  end
end
