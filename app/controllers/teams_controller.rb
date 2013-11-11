class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @team = Team.new
    @team.coach = params[:coach]
    @team.name = params[:name]
    @team.img_url = params[:img_url]
    
    if @team.save
      redirect_to teams_url
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find_by(:id => params[:id])
  end

  def update
    @team = Team.find_by(:id => params[:id])
    @team.coach = params[:coach]
    @team.name = params[:name]
    @team.img_url = params[:img_url]
    
    if @team.save
      redirect_to teams_url
    else
      render 'new'
    end
  end

  def destroy
    @team = Team.find_by(:id => params[:id])
    @team.destroy
    redirect_to teams_url
  end
end
