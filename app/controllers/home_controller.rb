class HomeController < ApplicationController
  before_action :require_login

  def top
    # ここにトップページのロジックを追加
  end

  private

  def require_login
    unless logged_in?
      redirect_to login_path, alert: 'ログインが必要です。'
    end
  end
end
