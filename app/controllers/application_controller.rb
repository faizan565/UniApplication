class ApplicationController < ActionController::Base

  before_action :require_user

  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:notice] = "Login Compulsory for action"
      redirect_to login_path
    end
  end
end
