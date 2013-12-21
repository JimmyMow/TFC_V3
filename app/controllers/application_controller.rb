class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception

before_filter :prepare_for_mobile
before_filter :display_session_values

def display_session_values
  Rails.logger.debug "mobile_param: #{session[:mobile_param]}"
  Rails.logger.debug "user_id: #{session[:user_id]}"
end

private

helper_method :current_user
helper_method :mobile_device?

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  def current_user
    begin
      current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      nil
    end
  end

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    if mobile_device?
      if request.format == :js
        request.format = :mobilejs
      else
        request.format = :mobile
      end
    end
  end
end
