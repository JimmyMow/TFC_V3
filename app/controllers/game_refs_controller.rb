class GameRefsController < ApplicationController

  def index
    @game_refs = GameRef.all
  end

  def show
    @game_ref = GameRef.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @game_ref = GameRef.new
    @game_ref.game_id = params[:game_id]
    @game_ref.ref_id = params[:ref_id]
    
    if @game_ref.save
      redirect_to game_refs_url
    else
      render 'new'
    end
  end

  def edit
    @game_ref = GameRef.find_by(:id => params[:id])
  end

  def update
    @game_ref = GameRef.find_by(:id => params[:id])
    @game_ref.game_id = params[:game_id]
    @game_ref.ref_id = params[:ref_id]
    
    if @game_ref.save
      redirect_to game_refs_url
    else
      render 'new'
    end
  end

  def destroy
    @game_ref = GameRef.find_by(:id => params[:id])
    @game_ref.destroy
    redirect_to game_refs_url
  end
end
