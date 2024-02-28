class ContactsController < ApplicationController
  before_action :require_login, except: [:create]
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # 保存に成功した場合の処理（例: リダイレクトやフラッシュメッセージの設定）
      redirect_to root_path, notice: 'お問い合わせありがとうございます。'
    else
      # 保存に失敗した場合の処理（例: エラーメッセージの表示）
      render 'static_pages/contact'
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end