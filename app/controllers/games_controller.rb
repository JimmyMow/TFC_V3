class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @game = Game.new
    @game.home_team_id = params[:home_team_id]
    @game.away_team_id = params[:away_team_id]
    @game.time = params[:time]
    
    if @game.save
      redirect_to games_url
    else
      render 'new'
    end
  end

  def edit
    @game = Game.find_by(:id => params[:id])
  end

  def update
    @game = Game.find_by(:id => params[:id])
    @game.home_team_id = params[:home_team_id]
    @game.away_team_id = params[:away_team_id]
    @game.time = params[:time]
    
    if @game.save
      redirect_to games_url
    else
      render 'new'
    end
  end

  def destroy
    @game = Game.find_by(:id => params[:id])
    @game.destroy
    redirect_to games_url
  end
end
