class StatusesController < ApplicationController
  before_action :set_status, only: [:edit, :update, :delete]

  def new
  end

  def create

    @user = User.new(
                    user_id: @current_user,
                    title: params[:status][:title],
                    content: params[:status][:content]
                      )
    if @user.save
      redirect_to user_path, flash: { notice: "Status updated!"}
    else
      @error = @user.errors.full_messages
      flash[:notice] = "#{@error.join(", ")}"
      render new
    end
  end


  def edit
  end

  def update
  end

  def delete
    @status.destroy
  end


private

  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:title, :content)
  end

end
