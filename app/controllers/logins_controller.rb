class LoginsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  def new; end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student&.authenticate(params[:logins][:password])
      session[:student_id] = student.id
      flash[:notice] = 'Login Successful'
      redirect_to student
    else
      flash.now[:notice] = 'Something was wrong'
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = 'Successfully Logged out'
    redirect_to root_path
  end
    
end