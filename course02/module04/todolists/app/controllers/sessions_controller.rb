class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    unless @user.authenticate(session_params[:password])
      return redirect_to login_path, alert: 'Wrong username or password'
    end

    session[:user_id] = @user.id
    redirect_to root_path, notice: 'Logged in successfully'
  end

  def destroy
    session.destroy
    return redirect_to login_path, notice: 'Logged out successfully'
  end

private
  def session_params
    params.require(:user).permit(:username, :password)
  end
end
