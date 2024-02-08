class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
  unless logged_in?
    flash[:alert] = "ログインが必要です"
    redirect_to login_url # ログインページへのパスに適宜置き換えてください
  end
end
end