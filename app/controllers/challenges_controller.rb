class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @challenge = Challenge.new
    @challenge.call_type = params[:call_type]
    @challenge.quarter = params[:quarter]
    @challenge.time = params[:time]
    @challenge.game_id = params[:game_id]
    @challenge.description = params[:description]
    @challenge.commit_player_id = params[:commit_player_id]
    @challenge.fouled_player_id = params[:fouled_player_id]
    @challenge.ref_id = params[:ref_id]
    @challenge.user_id = params[:user_id]
    
    if @challenge.save
      redirect_to challenges_url
    else
      render 'new'
    end
  end

  def edit
    @challenge = Challenge.find_by(:id => params[:id])
  end

  def update
    @challenge = Challenge.find_by(:id => params[:id])
    @challenge.call_type = params[:call_type]
    @challenge.quarter = params[:quarter]
    @challenge.time = params[:time]
    @challenge.game_id = params[:game_id]
    @challenge.description = params[:description]
    @challenge.commit_player_id = params[:commit_player_id]
    @challenge.fouled_player_id = params[:fouled_player_id]
    @challenge.ref_id = params[:ref_id]
    @challenge.user_id = params[:user_id]
    
    if @challenge.save
      redirect_to challenges_url
    else
      render 'new'
    end
  end

  def destroy
    @challenge = Challenge.find_by(:id => params[:id])
    @challenge.destroy
    redirect_to challenges_url
  end
end
