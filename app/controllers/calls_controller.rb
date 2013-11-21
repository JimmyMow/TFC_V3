class CallsController < ApplicationController

  def index
    @calls = Call.all
  end

  def show
    @call = Call.find_by(:id => params[:id])
  end

  def new
    @game = Game.find_by_id(params[:game_id])
    @players =  @game.home_team.players + @game.away_team.players
  end

  def create
    @call = Call.new
    @call.call_type = params[:call_type]
    @call.quarter = params[:quarter]
    @call.time = params[:time]
    @call.game_id = params[:game_id]
    @call.description = params[:description]
    @call.commit_player_id = params[:commit_player_id]
    @call.fouled_player_id = params[:fouled_player_id]
    @call.ref_id = params[:ref_id]


    if @call.save
      redirect_to game_url(params[:game_id])
    else
      render 'new'
    end
  end

  def edit
    @call = Call.find_by(:id => params[:id])
  end

  def update
    @call = Call.find_by(:id => params[:id])
    @call.call_type = params[:call_type]
    @call.quarter = params[:quarter]
    @call.time = params[:time]
    @call.game_id = params[:game_id]
    @call.description = params[:description]
    @call.commit_player_id = params[:commit_player_id]
    @call.fouled_player_id = params[:fouled_player_id]
    @call.ref_id = params[:ref_id]
    @call.user_id = params[:user_id]

    if @call.save
      redirect_to calls_url
    else
      render 'new'
    end
  end

  def destroy
    @call = Call.find_by(:id => params[:id])
    @call.destroy
    redirect_to calls_url
  end
end
