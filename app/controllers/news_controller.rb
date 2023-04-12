class NewsController < ApplicationController
  before_action :set_params
  def index
    render json: perform_sync if request.format.json?
    @new_subscription = Subscription.new
  end

  def query_search
    if request.format.json?
      render json: perform_sync, status: :ok
    else
      UpdateJob.perform_async(@url, "general", session.id.to_s, true)
    end
  end

  def next_page
    # JSON requests can use the root path to load the next page by setting the page and category param

    UpdateJob.perform_async(@url, @category, session.id.to_s, false)
  end
  def channel_id
    render json: { id: session.id.to_s }
  end

  def subscribe_to_news_stream
    LoadNewsJob.perform_async(@url, @category, session.id.to_s)
  end

  private

  def set_params
    p "params are #{params}"
    @country_name = params[:country]
    @country = Country.find_by(name: @country_name).try(:code) || @country
    @category = params[:category] || @category
    @page = params[:page] || @category
    @pageSize = params[:pageSize] || @pageSize
    @keyWord = params[:query]

    @country = "us" if (@keyWord.nil? && @country.nil?)
    @query_params = {
      apiKey: @apiKey,
      country: @country, # this is a required field in the query params
      page: @page,
      pageSize: @pageSize,
      q: @keyWord,
      category: @category
    }

    @query_params.compact!
    @url = "https://newsapi.org/v2/top-headlines?#{@query_params.to_query}"
    p "URL is : #{@url} "
  end

  def perform_sync
    data = {}
    if @category.nil?
      response = HTTParty.get(@url + "&category=general")
      data["general"] = JSON.parse(response.body)
      Category.all.each do |category|
        response = HTTParty.get(@url + "&category=#{category.name}")
        if response.code == 200
          data[category.name] = JSON.parse(response.body)
        else
          data[category.name] = "Error: #{response.code}"
        end
      end
    else
      response = HTTParty.get(@url + "&category=#{@category}")
      if response.code == 200
        data[@category] = JSON.parse(response.body)
      else
        data[@category] = "Error: #{response.code}"
      end
    end
    data
  end
end
