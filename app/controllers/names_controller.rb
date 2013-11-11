class NamesController < ApplicationController

  def index
    @names = Name.all
  end

  def show
    @name = Name.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @name = Name.new
    @name.img_url = params[:img_url]
    
    if @name.save
      redirect_to names_url
    else
      render 'new'
    end
  end

  def edit
    @name = Name.find_by(:id => params[:id])
  end

  def update
    @name = Name.find_by(:id => params[:id])
    @name.img_url = params[:img_url]
    
    if @name.save
      redirect_to names_url
    else
      render 'new'
    end
  end

  def destroy
    @name = Name.find_by(:id => params[:id])
    @name.destroy
    redirect_to names_url
  end
end
