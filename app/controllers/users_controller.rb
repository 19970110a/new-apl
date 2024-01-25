class UsersController < ApplicationController
    before_action :authenticate_user, only: [:choose_character, :save_character]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        auto_login(@user)
        redirect_to choose_character_path, notice: 'ユーザー登録が完了しました。'
    else
      flash.now[:alert] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end

  def choose_character
    # もしユーザーがログインしていなければ、ログインページにリダイレクトする
    redirect_to new_session_path unless current_user
    # @userにcurrent_userをセットする
    @user = current_user
  end

  def save_character
    @user = current_user
    character = Character.find(params[:character_id])
    @user.characters << character
  
    if @user.save
      redirect_to home_top_path
    else
      render :choose_character
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :weight)
  end

  def character_params
    params.require(:user).permit(:character)
  end

  def authenticate_user
    redirect_to login_path unless current_user
  end
end