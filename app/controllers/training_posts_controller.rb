class TrainingPostsController < ApplicationController
  def index
    @training_posts = TrainingPost.all
    
  end

  def show
  end

  def new
    @training_post = TrainingPost.new
  end

  def create
    @training_post = current_user.training_posts.new(training_post_params)
    @training_post.save!
    redirect_to root_url, notice: "投稿しました。" 
  end

  def edit
  end


private

  def training_post_params
    params.require(:training_post).permit(:training_place, :training_advance, :training_task, :training_impression)
  end
end
