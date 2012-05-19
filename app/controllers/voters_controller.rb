class VotersController < ApplicationController

  # GET /voters/new
  def new
    @voter = Voter.new
  end

  # POST /voters
  def create
    @voter = Voter.new(params[:voter])
    if @voter.save
      session[:voter_id] = @voter.id
      if @voter.intends_to_vote?
        redirect_to new_vote_path
      else
        redirect_to results_path
      end
    else
      render action: "new"
    end
  end

end
