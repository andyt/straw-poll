class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_constituencies

  protected

  def find_constituencies
    @constituencies = Constituency.all
  end
  
end
