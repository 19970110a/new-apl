class SessionsController < ApplicationController
  def new
    # ログインページを表示
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to top_path, notice: 'ログインに成功しました。'
    else
      flash.now[:alert] = 'ログインに失敗しました。'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました。'
  end
end