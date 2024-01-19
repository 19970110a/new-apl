class UsersController < ApplicationController
    def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # ユーザーを動物を選択する画面にリダイレクト
      redirect_to choose_animal_path
    else
      # 登録に失敗した場合、フォームを再度表示
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :weight)
  end
end