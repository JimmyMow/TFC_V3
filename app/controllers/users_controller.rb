class UsersController < ApplicationController
  # before_action :set_user, only: [:edit, :show, :update, :destroy]
  # before_action :protection, only: [:edit, :update, :destroy]

  def protection
    # unless current_user.id == @user.id
    #   redirect_to :back, notice: 'Not allowed.'
    # end
    if current_user.id != @user.id
      redirect_to :back, notice: 'Not allowed.'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(:id => params[:id])
    @activity = @user.activity.sort_by! { |x| x.created_at }.reverse!
  end

  def new
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      session[:user_id] = @user.id
      redirect_to games_url
    else
      redirect_to new_session_url, notice: 'We had trouble signing you up. Please try again.'
    end
  end

  def edit
    @user = User.find_by(:id => params[:id])
  end

  def update
    if current_user.present?
      @user = User.find_by(:id => params[:id])
      @user.first_name = params[:user][:first_name]
      @user.last_name = params[:user][:last_name]
      @user.username = params[:user][:username]
      @user.email = params[:user][:email]
      @user.iq = params[:user][:iq]
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      @user.description = params[:user][:description]
    end

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

  private
  def set_user
    @user = User.find_by(params[:id])
  end
end
