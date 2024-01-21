class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # 保存に成功したときの処理をここに記述します。
      # 例: リダイレクト、フラッシュメッセージの設定など
    else
      # 保存に失敗したときは、エラーメッセージを含めてフォームを再表示
      render 'static_pages/contact'
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
