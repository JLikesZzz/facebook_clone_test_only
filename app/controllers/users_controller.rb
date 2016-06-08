class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if @user.save
      flash[:notice] = "Account created. Please log in now."
      redirect_to "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      flash[:alert] = "Error creating account: #{@errors}"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
   if @user.save
        flash[:notice] = "Account is updated successfully."
       redirect_to "/users/#{@user.id}"
   else
     flash[:warning] = "#{@user.errors.full_messages}"
     render :edit
   end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Account is deleted"
    redirect_to statuses_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params

    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
