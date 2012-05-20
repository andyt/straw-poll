class ConstituenciesController < ApplicationController

  def index
    @vote_count = Vote.count
    @parties = Party.all.sort_by { |p| p.vote_count }.reverse
  end

  def show
    if @constituency = Constituency.where(:parameter => params[:id]).first
      @candidates = @constituency.candidates_by_vote_count
    else
      raise RuntimeError, "Invalid constituency." # not veryy friendly!
    end
  end
end
