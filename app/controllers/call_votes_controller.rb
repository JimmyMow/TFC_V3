class CallVotesController < ApplicationController

  def index
    @call_votes = CallVote.all
  end

  def show
    @call_vote = CallVote.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @call_vote = CallVote.new
    @call_vote.user_id = params[:user_id]
    @call_vote.call_id = params[:call_id]
    @call_vote.vote = params[:vote]
    
    if @call_vote.save
      redirect_to call_votes_url
    else
      render 'new'
    end
  end

  def edit
    @call_vote = CallVote.find_by(:id => params[:id])
  end

  def update
    @call_vote = CallVote.find_by(:id => params[:id])
    @call_vote.user_id = params[:user_id]
    @call_vote.call_id = params[:call_id]
    @call_vote.vote = params[:vote]
    
    if @call_vote.save
      redirect_to call_votes_url
    else
      render 'new'
    end
  end

  def destroy
    @call_vote = CallVote.find_by(:id => params[:id])
    @call_vote.destroy
    redirect_to call_votes_url
  end
end
