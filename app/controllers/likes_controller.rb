class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(training_post_id: params[:training_post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(training_post_id: params[:training_post_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
