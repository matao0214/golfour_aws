class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  before_action :set_user, only: %i[show edit update]
  before_action :correct_user, only: %i[edit update]

  def show
    @training_posts = @user.training_posts.recent
    @liked_training_posts = @user.liked_posts.recent
    @training_contents = TrainingContent.where(training_post_id: @training_posts)
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "ユーザー「#{@user.nickname}」を登録しました。"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "ユーザー「#{@user.nickname}」を更新しました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :golf_reki, :goal)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless current_user.own?(@user)
  end
end
