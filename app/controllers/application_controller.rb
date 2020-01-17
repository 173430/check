#app/controllers//application_controller.rb

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  def require_login
    logger.debug 'ログイン判定'
    logger.debug logged_in?
    
    if !logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end

end
