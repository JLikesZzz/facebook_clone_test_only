class LikesController < ApplicationController
  def create

      @like = Like.find_or_initialize_by(status_id: like_params[:status], user_id: like_params[:user])
      unless @like.id
        @like.save
        status = Status.find(like_params[:status].to_i)
        flash[:notice] = "You liked #{status.title}!"
      else
        flash[:alert] = 'You liked before!'
      end
      redirect_to root_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    flash[:notice] = 'You unlike.'
    redirect_to status_path(@like.status)

  end

  private
  def like_params
    params.require(:like).permit(:user, :status)
  end
end
