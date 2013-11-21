class PlayersController < ApplicationController

  def index
    @players = Player.all.page(params[:page]).per(15)
  end

  def show
    @player = Player.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @player = Player.new
    @player.name = params[:name]
    @player.number = params[:number]
    @player.img_url = params[:img_url]
    @player.team_id = params[:team_id]

    if @player.save
      redirect_to players_url
    else
      render 'new'
    end
  end

  def edit
    @player = Player.find_by(:id => params[:id])
  end

  def update
    @player = Player.find_by(:id => params[:id])
    @player.name = params[:name]
    @player.number = params[:number]
    @player.img_url = params[:img_url]
    @player.team_id = params[:team_id]

    if @player.save
      redirect_to players_url
    else
      render 'new'
    end
  end

  def destroy
    @player = Player.find_by(:id => params[:id])
    @player.destroy
    redirect_to players_url
  end
end
