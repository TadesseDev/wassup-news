class NewsController < ApplicationController
  before_action :set_params
  def index
    if request.format.html?
      LoadNewsJob.perform_async(@url, @category, session.id.to_s)
    elsif request.format.json?
      render json: perform_sync
    end
    console
  end

  def query_search
    if request.format.json?
      render json: perform_sync
    else
      UpdateJob.perform_async(@url, "general", session.id.to_s)
    end
  end

  def channel_id
    render json: { id: session.id.to_s }
  end

  private

  def set_params
    p "params are #{params}"
    @country_name = params[:country]
    @country = Country.find_by(name: @country_name).try(:code) || @country
    @category = Country.find_by(name: params[:category]).try(:code) || @category
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
    @country = "us" if (@keyWord.nil? && @country.nil?)
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
