class ChallengeCommentVotesController < ApplicationController

  def index
    @challenge_comment_votes = ChallengeCommentVote.all
  end

  def show
    @challenge_comment_vote = ChallengeCommentVote.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @challenge_comment_vote = ChallengeCommentVote.new
    @challenge_comment_vote.user_id = params[:user_id]
    @challenge_comment_vote.challenge_comment_id = params[:challenge_comment_id]
    @challenge_comment_vote.vote = params[:vote]

    respond_to do |format|
      if @challenge_comment_vote.save
        format.js
        format.html { redirect_to game_url(params[:game_id]) }
      else
        format.html { redirect_to game_url(params[:game_id]), notice: 'There was an error submitting your vote.'}
      end
    end
  end

  def edit
    @challenge_comment_vote = ChallengeCommentVote.find_by(:id => params[:id])
  end

  def update
    @challenge_comment_vote = ChallengeCommentVote.find_by(:id => params[:id])
    @challenge_comment_vote.user_id = params[:user_id]
    @challenge_comment_vote.challenge_comment_id = params[:challenge_comment_id]
    @challenge_comment_vote.vote = params[:vote]

    if @challenge_comment_vote.save
      redirect_to challenge_comment_votes_url
    else
      render 'new'
    end
  end

  def destroy
    @challenge_comment_vote = ChallengeCommentVote.find_by(:id => params[:id])
    @challenge_comment_vote.destroy
    redirect_to challenge_comment_votes_url
  end
end
