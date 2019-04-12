class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_params)
    if user && user.authenticate(password_params[:password])
      log_in user
      redirect_to pages_schedule_path, success: 'Logged In!'
    else
      flash.now[:danger] = 'Try again'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'Logged Out!'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def email_params
    params.require(:session).permit(:email)
  end

  def password_params
    params.require(:session).permit(:password)
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
