class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :authenticate_user, only: [:choose_character, :save_character]

  def new
    @user = User.new
  end

  def show
  # ユーザーが選択したキャラクターのIDを基にキャラクターを取得
  selected_character = Character.find(session[:selected_character_id])
  
  # 選択されたキャラクターに紐付けられたセリフをランダムに取得
  @random_speech = selected_character.random_speeches.order("RANDOM()").first
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to home_top_path, notice: 'ユーザー登録が完了しました。'
    else
      flash.now[:alert] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :weight, :character_id)
  end

  def authenticate_user
    redirect_to login_path unless current_user
  end
end