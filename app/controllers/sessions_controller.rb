class SessionsController < ApplicationController

def new

end

def create
    user = User.find_by_username(params[:username])
  if user.present? && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to games_url
  else
    redirect_to new_session_url
  end
end

def destroy
  reset_session
  redirect_to new_session_url
end


end
