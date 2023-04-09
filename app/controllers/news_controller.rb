class NewsController < ApplicationController
  def index
    LoadNewsJob.perform_async(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=49aee5edf0084e3f85deb45474c96721"
    )
  end
end
