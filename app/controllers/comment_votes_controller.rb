class CommentVotesController < ApplicationController

  def index
    @comment_votes = CommentVote.all
  end

  def show
    @comment_vote = CommentVote.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @comment_vote = CommentVote.new
    @comment_vote.user_id = params[:user_id]
    @comment_vote.comment_id = params[:comment_id]
    @comment_vote.vote = params[:vote]

    respond_to do |format|
      if @comment_vote.save
        #CallVote.where(:user_id => params[:user_id], :call_id => params[:call_id], :comment_id => params[:comment_id]).destroy
        format.js
        format.html { redirect_to game_url(params[:game_id]) }
      else
        render 'new'
      end
    end
  end

  def edit
    @comment_vote = CommentVote.find_by(:id => params[:id])
  end

  def update
    @comment_vote = CommentVote.find_by(:id => params[:id])
    @comment_vote.user_id = params[:user_id]
    @comment_vote.comment_id = params[:comment_id]
    @comment_vote.vote = params[:vote]

    if @comment_vote.save
      redirect_to comment_votes_url
    else
      render 'new'
    end
  end

  def destroy
    @comment_vote = CommentVote.find_by(:id => params[:id])
    @comment_vote.destroy
    redirect_to comment_votes_url
  end
end
