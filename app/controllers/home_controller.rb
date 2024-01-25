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

  def drinking_graph
    # 飲酒データを集計するロジック
  end

  def share
    # 必要なデータを準備する
  end
  
end
