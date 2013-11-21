class ChallengeVotesController < ApplicationController

  def index
    @challenge_votes = ChallengeVote.all
  end

  def show
    @challenge_vote = ChallengeVote.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @challenge_vote = ChallengeVote.new
    @challenge_vote.user_id = params[:user_id]
    @challenge_vote.challenge_id = params[:challenge_id]
    @challenge_vote.vote = params[:vote]

    respond_to do |format|
      if @challenge_vote.save
        format.js
        format.html { redirect_to challenge_votes_url }
      else
        render 'new'
      end
    end
  end

  def edit
    @challenge_vote = ChallengeVote.find_by(:id => params[:id])
  end

  def update
    @challenge_vote = ChallengeVote.find_by(:id => params[:id])
    @challenge_vote.user_id = params[:user_id]
    @challenge_vote.challenge_id = params[:challenge_id]
    @challenge_vote.vote = params[:vote]

    if @challenge_vote.save
      redirect_to challenge_votes_url
    else
      render 'new'
    end
  end

  def destroy
    @challenge_vote = ChallengeVote.find_by(:id => params[:id])
    @challenge_vote.destroy
    redirect_to challenge_votes_url
  end
end
