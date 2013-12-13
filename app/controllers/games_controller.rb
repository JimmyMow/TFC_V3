class GamesController < ApplicationController

  def index
    @games = Game.all
    @top_users = User.all.sort_by! { |x| x.score }.reverse!.slice(0,5)
  end

  def show
    @game = Game.find_by(:id => params[:id])
    @comment = Comment.new
    @challenge = Challenge.new
    @calls = Call.all.page(params[:page]).per(5)
    @challenges = Challenge.all.page(params[:page]).per(5)

  end

  def new
    @teams = Team.all
    @refs = Ref.all
  end

  def create
    @game = Game.new
    @game.home_team_id = params[:home_team_id]
    @game.away_team_id = params[:away_team_id]
    @game.time = params[:time]

    if @game.save
      GameRef.create(game_id: @game.id, ref_id: params[:ref_one_id])
      GameRef.create(game_id: @game.id, ref_id: params[:ref_two_id])
      GameRef.create(game_id: @game.id, ref_id: params[:ref_three_id])

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
