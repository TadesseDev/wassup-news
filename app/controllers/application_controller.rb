class ApplicationController < ActionController::Base
  before_action :set_queries
  def set_queries
    @category = Category.all
    @countries = Country.all
    @category = nil
    @country = nil
    @keyWord = nil
    @page = 1
    @pageSize = 10
  end
end
