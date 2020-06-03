class TrainingPostsController < ApplicationController
  before_action :set_training_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_training_post, only: [:edit, :update]

  def index
    @q = TrainingPost.all.ransack(params[:q])
    @training_posts = @q.result(distinct: true).recent
  end

  def show
  end

  def new
    @training_post = TrainingPost.new
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
    params.require(:training_post).permit(:training_place, :training_advance, :training_task, :training_impression)
  end

  def set_training_post
    @training_post = TrainingPost.find(params[:id])
  end

  def correct_training_post
    redirect_to root_path if !current_user.own_post?(@training_post)
  end

  # def correct_training_post
  #   redirect_to root_path if current_user.id != @training_post.user_id
  # end

  
  


end
