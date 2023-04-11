class ApplicationController < ActionController::Base
  before_action :set_queries

  def set_queries
    @categories = Category.all
    @countries = Country.all
    @category = nil
    @country = nil
    @keyWord = nil
    @page = 1
    @pageSize = 6
    @news = {}
  end
end
