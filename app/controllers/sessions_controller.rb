class SessionsController < ApplicationController



  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user.password == params[:password]
      @user.save
      session[:current_user_id] = @user.id
      redirect_to statuses_path, flash: { notice: "Log in successfully, #{@user.name}!"}
    else
      flash[:alert] = "Please log in again"
    end
  end

  # def show
  #   if session[:current_user_id]
  #     if User.find(session[:current_user_id])
  #       redirect_to root_path
  #     end
  #   end
  # end

  def delete
    session[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end


private

  def session_params
    params.require(:session).permit(:email, :password)
  end





end
