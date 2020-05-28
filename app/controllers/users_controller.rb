class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user), notice: "ユーザー「#{@user.nickname}」を登録しました。"
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
    set_user
    if current_user != @user
      redirect_to root_path
    end
  end
end
