class SessionsController < ApplicationController

  def new
  end


  def create
    @user = User.find_by(session_params)
    if @user
      log_in(@user)
      flash[:notice] = "Welcome, #{@user.email}!"
      redirect_to statuses_path
    else
      flash[:alert] = "Please log in again"
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end


private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
