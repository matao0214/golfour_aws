class TrainingPostsController < ApplicationController
  before_action :set_training_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_training_post, only: [:edit, :update]

  def index
    @q = TrainingPost.all.ransack(params[:q])
    @training_posts = @q.result(distinct: true).recent
  end

  def show
    @like = Like.new
    @lat = @training_post.spot.latitude
    @lng = @training_post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def new
    @training_post = TrainingPost.new
    @training_post.build_spot
    @training_post.build_training_content
    @training_post.build_training_task
  end

  def create
    @training_post = current_user.training_posts.new(training_post_params)
    
    if @training_post.save
      redirect_to root_url, notice: "投稿しました。" 
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @training_post.update(training_post_params)
      redirect_to training_post_url, notice: "投稿を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @training_post.destroy
    redirect_to root_url, notice: "投稿を削除しました。"
  end

private

  def training_post_params
    params.require(:training_post).permit(:training_impression, spot_attributes: [:address], training_content_attributes: [:training_time, :training_hits], training_task_attributes: [:training_task_1, :training_task_2, :training_task_3, :training_task_4, :training_task_5, :training_task_6, :training_task_a])
  end

  def set_training_post
    @training_post = TrainingPost.find(params[:id])
  end

  def correct_training_post
    redirect_to root_path unless current_user.own_post?(@training_post)
  end
end
