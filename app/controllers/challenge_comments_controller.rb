class ChallengeCommentsController < ApplicationController

  def index
    @challenge_comments = ChallengeComment.all
  end

  def show
    @challenge_comment = ChallengeComment.find_by(:id => params[:id])
  end

  def new
    @challenge_comment = ChallengeComment.new
  end

  def create
    @challenge_comment = ChallengeComment.new
    @challenge_comment.text = params[:challenge_comment][:text]
    @challenge_comment.challenge_id = params[:challenge_comment][:challenge_id]
    @challenge_comment.user_id = params[:challenge_comment][:user_id]

    respond_to do |format|
      if @challenge_comment.save
        format.js
        format.html { redirect_to game_url(params[:challenge_comment][:game_id]) }
      else
        render 'new'
      end
    end
  end

  def edit
    @challenge_comment = ChallengeComment.find_by(:id => params[:id])
  end

  def update
    @challenge_comment = ChallengeComment.find_by(:id => params[:id])
    @challenge_comment.text = params[:text]
    @challenge_comment.challenge_id = params[:challenge_id]
    @challenge_comment.user_id = params[:user_id]

    if @challenge_comment.save
      redirect_to challenge_comments_url
    else
      render 'new'
    end
  end

  def destroy
    @challenge_comment = ChallengeComment.find_by(:id => params[:id])
    @challenge_comment.destroy
    redirect_to challenge_comments_url
  end
end
