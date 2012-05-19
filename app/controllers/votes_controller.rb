class VotesController < ApplicationController
  def new
    if @voter = Voter.find(session[:voter_id])
      @vote = Vote.new(:voter => @voter)
      @candidates = @voter.constituency.candidates.all
    else
      flash.now[:error] = 'There was a problem recording your vote.'
    end
  end

  def create
    @vote = Vote.new(params[:vote])

    respond_to do |format|
      if @vote.save
        redirect_to results_path, notice: 'Your voting intention was successfully registered.'
      else
        render action: "new"
      end
    end
  end
end
