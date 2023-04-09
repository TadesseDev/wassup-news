class ApplicationController < ActionController::Base
  before_action :set_queries
  def set_queries
    @category = Category.all
    @country = Country.all
  end
end
