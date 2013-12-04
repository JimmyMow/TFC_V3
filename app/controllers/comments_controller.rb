class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find_by(:id => params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.text = params[:comment][:text]
    @comment.call_id = params[:comment][:call_id]
    @comment.user_id = params[:comment][:user_id]
    @comment.challenge_id = params[:comment][:challenge_id]

    respond_to do |format|
      if @comment.save
        params[:comment][:challenge_id]
        format.js
        format.html { redirect_to game_url(params[:comment][:game_id]), notice: 'It refrshed the page JS did not run.' }
      else
        format.html { redirect_to game_url(params[:comment][:game_id]), notice: 'There was an error submitting your comment.' }
      end
    end
  end

  def edit
    @comment = Comment.find_by(:id => params[:id])
  end

  def update
    @comment = Comment.find_by(:id => params[:id])
    @comment.text = params[:text]
    @comment.call_id = params[:call_id]
    @comment.user_id = params[:user_id]
    @comment.challenge_id = params[:challenge_id]

    if @comment.save
      redirect_to comments_url
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find_by(:id => params[:id])
    @comment.destroy
    redirect_to comments_url
  end
end
