class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_constituencies

  protected

  def find_constituencies
    @constituencies = Constituency.includes(:party).all
    @grouped_constituencies = @constituencies.group_by { |c| c.name.first }
  end
  
end
