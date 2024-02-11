module Admin
    class SessionsController < ApplicationController
        skip_before_action :require_login, only: [:new, :create]
      def new
        # ログインページを表示
      end
  
      def create
        user = login(params[:session][:email], params[:session][:password], true)
        if user && user.admin?
          respond_to do |format|
            format.html { redirect_to new_admin_random_speech_path }
            format.turbo_stream { redirect_to new_admin_random_speech_path }
          end # <- このendがrespond_toブロックの終了を示します
        else
          flash.now[:alert] = 'ログインに失敗しました。'
          render :new
        end # <- このendがif文の終了を示します
      end
  
      def destroy
        logout
        redirect_to admin_login_path, notice: 'ログアウトしました。'
      end
    end
  end