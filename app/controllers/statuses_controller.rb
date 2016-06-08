class StatusesController < ApplicationController

before_action :set_status, only: [:edit, :update, :destroy]

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(user_id: params[:user_id], title: params[:status][:title], content: params[:status][:content])
    if @status.save
      flash[:notice] = "Status is created successfully."
      redirect_to status_path(@status)
    else
      @error = @status.errors.full_messages
      flash[:alert] = "Error creating status."
      render :new
    end
  end


  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status.update(status_params)
   if @status.save
        flash[:notice] = "Status is updated successfully."
       redirect_to "/statuses/#{@status.id}"
   else
     flash[:warning] = "#{@status.errors.full_messages}"
     render :edit
   end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    flash[:notice] = 'Status is deleted.'
    redirect_to statuses_path
  end


private

  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:title, :content)
  end

end
