class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    @user.save

    session[:user_id] = @user.id

    redirect_to games_url
  end

  def edit
    @user = User.find_by(:id => params[:id])
  end

  def update
    @user = User.find_by(:id => params[:id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.username = params[:username]
    @user.email = params[:email]
    @user.iq = params[:iq]
    @user.password_digest = params[:password_digest]
    @user.description = params[:description]

    if @user.save
      redirect_to user_url(params[:id])
    else
      redirect_to edit_user_url(params[:id])
    end
  end

  def destroy
    @user = User.find_by(:id => params[:id])
    @user.destroy
    redirect_to users_url
  end
end
